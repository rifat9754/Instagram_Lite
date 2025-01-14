//
//  ShopView.swift
//  Instagram
//
//  Created by Ahanaf Tahmid Rifat on 9/1/25.
//

import SwiftUI
import Combine


// MARK: - Models
struct APIResponse: Codable {
    let data: CategoryData
}

struct CategoryData: Codable {
    var categories: [Category]
}

struct Category: Codable, Identifiable {
    let id = UUID()
    let name: String
    var items: [Item]
}

struct Item: Codable, Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let post_date: String
    let description: String
    let seller_name: String
    let contact_number: String
}

// MARK: - ViewModel
class CategoryViewModel: ObservableObject {
    @Published var categories: [Category] = []
    @Published var isLoading = true
    @Published var errorMessage: String? = nil
    
    private var cancellables = Set<AnyCancellable>()
    
    func fetchCategories() {
        guard let url = URL(string: "https://api.myjson.online/v1/records/19931b75-5ec3-457f-a3c7-39f3928e496f") else {
            errorMessage = "Invalid URL"
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: APIResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.errorMessage = "Failed to load categories: \(error.localizedDescription)"
                case .finished:
                    break
                }
                self?.isLoading = false
            }, receiveValue: { [weak self] response in
                self?.categories = response.data.categories
            })
            .store(in: &cancellables)
    }
    
    func addItem(categoryName: String, newItem: Item) {
        if let index = categories.firstIndex(where: { $0.name == categoryName }) {
            categories[index].items.append(newItem)
        }
    }
}

// MARK: - Views
struct ShopView: View {
    @StateObject private var viewModel = CategoryViewModel()
    @State private var showAddItemView = false
    
    var body: some View {
        NavigationView {
            List(viewModel.categories) { category in
                NavigationLink(destination: ItemListView(category: category)) {
                    Text(category.name)
                }
            }
            .navigationTitle("Categories")
            .onAppear {
                viewModel.fetchCategories()
            }

        }

    }
}

// Second Page: Display Items in the Selected Category
struct ItemListView: View {
    let category: Category
    
    var body: some View {
        List(category.items) { item in
            NavigationLink(destination: ItemDetailView(item: item)) {
                HStack {
                    AsyncImage(url: URL(string: item.image)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image.resizable().scaledToFit().frame(width: 50, height: 50)
                        case .failure:
                            Image(systemName: "photo.fill")
                        @unknown default:
                            EmptyView()
                        }
                    }
                    VStack(alignment: .leading) {
                        Text(item.name).font(.headline)
                        Text(item.post_date).font(.subheadline).foregroundColor(.gray)
                    }
                }
            }
        }
    }
}

// Third Page: Item Detail View
struct ItemDetailView: View {
    let item: Item
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: item.image)) { phase in
                switch phase {
                case .success(let image):
                    image.resizable().scaledToFit().frame(height: 200)
                default:
                    ProgressView()
                }
            }
            Text(item.name).font(.largeTitle)
            Text(item.description).padding()
            Text("Seller: \(item.seller_name)")
            Text("Contact: \(item.contact_number)")
        }
        .navigationTitle(item.name)
    }
}

#Preview {
    ShopView()
}
