//
//  RecipesCell.swift
//  HelloFreshDevTest
//
//  Created by Ahmed Sultan Hussien Hamza on 13/11/2021.
//
import UIKit
import Kingfisher

class RecipesCell: UITableViewCell {

    @IBOutlet weak var recipesImageView: UIImageView!
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var shadow: UIView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var preparedMinutesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        bgView.layer.cornerRadius = 12
        bgView.layer.masksToBounds = true
        shadow.addShadow()
    }
    
    func configure( _ recipe: RecipesListScene.RecipesList.ViewModel) {
        nameLabel.text = recipe.name
        headlineLabel.text = recipe.headline
        preparedMinutesLabel.text = "\(recipe.preparationMinutes ?? 0) min"
        ImagesUtils.downloadImage(url: recipe.image ?? "") { [weak self] image in
            guard let self = self else { return }
            self.recipesImageView.image = image
            self.layoutIfNeeded()
        }
        selectCell(recipe.selected)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    
        bgView.layer.borderColor = UIColor.clear.cgColor
        bgView.layer.borderWidth = 0
    }
    
    func selectCell(_ isSelected: Bool?) {
        if isSelected ?? false {
            bgView.layer.borderColor = UIColor.green.cgColor
            bgView.layer.borderWidth = 1
        }else {
            bgView.layer.borderColor = UIColor.clear.cgColor
            bgView.layer.borderWidth = 0           
        }
    }

}
