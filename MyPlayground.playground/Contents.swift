//// Given a non-empty array of integers nums, every element appears twice except for one.
//// Write a Swift function that returns the one element that only appears once.
//
//
//// Try to implement an efficient solution.
//
//
//
//// Example 1:
//
//// Input: nums = [2,2,1]
//// Output: 1
//// Example 2:
//
//// Input: nums = [4,1,2,1,2]
//// Output: 4
//// Example 3:
//
//// Input: nums = [1]
//// Output: 1
//
//
//print("hello")
//
//func whoAppearsOnce(_ nums: [Int]) -> Int {
//  var aux : [Int] = nums
//  while !aux.isEmpty {
//    guard let num = aux.first else { return 0 }
//    aux.remove(at: 0)
//    if !aux.contains(num) {
//      return num
//    } else {
//      aux.removeAll { $0 == num }
//    }
//  }
//  return 0 //
//}
//
//
//print(whoAppearsOnce([2,2,1]))
//print(whoAppearsOnce([4,1,2,1,2]))
//print(whoAppearsOnce([1]))
//
//
//
//// Given a backend (e.g., http://pictures.api/getimage  that accepts POST request, with width and height as parameters and returns a random image of width/height.
//
//// Implement a swift function that request an image of 256x256 and converts it to a UIImage.
//// Write code that saves the image results locally.
//// Write code that loads the 5 most recent images images when the app restarts.
//
//
//
//// Rough structure as follows:
//
//
//// Skeleton for class
//
//
//class ImageManager {
//    static let shared = ImageManager()
//    private let baseURL = "http://pictures.api"
//
//    // Implement
//    func requestImage(...)
//
//    private func saveImage(...)
//      // Implement
//
//    private func loadImage(...)
//     // Implement
//
//    func loadMostRecentImages(...) -> [UIImage]
//    // Implement
//
//}
//
//class ImageManager {
//  static let shared = ImageManager()
//  private let baseURL = "http://pictures.api"
//
//  enum APIError: Error {
//    case malformedURL
//  }
//
//   func requestImage( completion:(UIImage) -> (), error: (Error) -> ()){
//    guard let url = URL(string:baseURL) else {
//        error(ApiError.malformedURL)
//        return
//    }
//    request.httpMethod = "POST"
//    let parameters = ["height": 256, "width": 256]
//
//    URLSession.shared.dataTask(with: url) { data, response, error in
//      if error ! nil {
//        error(error)
//        return
//      }
//      if let image = UIImage(data: data) {
//         completion(image)
//         return
//      }
//    }
//
//   }
//  // Implement
//
//  private func saveImage(...)
//    // Implement
//
//  private func loadImage(...)
//   // Implement
//
//  func loadMostRecentImages(...) -> [UIImage]
//  // Implement
//
//}






