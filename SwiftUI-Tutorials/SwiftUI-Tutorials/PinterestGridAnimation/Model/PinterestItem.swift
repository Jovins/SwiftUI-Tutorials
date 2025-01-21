import SwiftUI

struct PinterestItem: Identifiable, Hashable {
    private(set) var id: UUID = .init()
    var title: String
    var image: UIImage?
}

var pinterestItems: [PinterestItem] = [
    .init(title: "Abril Altamirano",            image: UIImage(named: "Photo_Pic1")),
    .init(title: "Gülsah Aydogan",              image:UIImage(named : "Photo_Pic2")),
    .init(title: "Melike Sayar Melikesayar",    image: UIImage(named: "Photo_Pic3")),
    .init(title: "Maahid Photos",               image:UIImage(named: "Photo_Pic4")),
    .init(title: "Pelageia Zelenina",           image:UIImage(named: "Photo_Pic5")),
    .init(title: "Ofir Eliav",                  image:UIImage(named: "Photo_Pic6")),
    .init(title: "Melike Sayar Melikesayar",    image: UIImage(named:"Photo_Pic7")),
    .init(title: "Melike Sayar Melikesayar",    image: UIImage(named:"Photo_Pic8")),
    .init(title: "Melike Sayar Melikesayar",    image: UIImage(named:"Photo_Pic9")),
    .init(title: "Erik Mclean",                 image:UIImage(named: "Photo_Pic10")),
    .init(title: "Fatma DELIASLAN",             image:UIImage(named: "Photo_Pic11")),
]
