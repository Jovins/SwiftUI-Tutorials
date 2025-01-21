import SwiftUI

struct PhotoItem: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var title: String
    var image: UIImage?
    var previewImage: UIImage?
    var appeared: Bool = false
}

var sampleItems: [PhotoItem] = [
    .init(title: "Fanny Hagan",                 image: UIImage(named: "Photo_Pic1")),
    .init(title: "Han-Chieh Lee",               image: UIImage(named: "Photo_Pic2")),
    .init(title: "xiaofu666",                   image: UIImage(named: "Photo_Pic3")),
    .init(title: "Abril Altamirano",            image: UIImage(named: "Photo_Pic4")),
    .init(title: "Gülsah Aydogan",              image: UIImage(named: "Photo_Pic5")),
    .init(title: "Melike Sayar Melikesayar",    image: UIImage(named: "Photo_Pic6")),
    .init(title: "Maahid Photos",               image: UIImage(named: "Photo_Pic7")),
    .init(title: "Pelageia Zelenina",           image: UIImage(named: "Photo_Pic8")),
    .init(title: "Ofir Eliav",                  image: UIImage(named: "Photo_Pic9")),
    .init(title: "Melike Sayar Melikesayar",    image: UIImage(named: "Photo_Pic10")),
    .init(title: "Lurich Sayar Hello World",    image: UIImage(named: "Photo_Pic11")),
    .init(title: "Han-Chieh Lee",               image: UIImage(named: "Photo_Pic12")),
    .init(title: "Chieh",                       image: UIImage(named: "Photo_Pic13")),
    .init(title: "Abril Altamirano",            image: UIImage(named: "Photo_Pic14")),
    .init(title: "Gülsah Aydogan",              image: UIImage(named: "Photo_Pic15")),
    .init(title: "Melike Sayar Melikesayar",    image: UIImage(named: "Photo_Pic16")),
    .init(title: "Maahid Photos",               image: UIImage(named: "Photo_Pic17"))
]

