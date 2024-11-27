//
//  RecipeListViewCell.swift
//  demo
//
//  Created by Hanitha Dhavileswarapu on 11/7/24.
//

import SwiftUI

struct RecipeListViewCell: View {
    
    let cusine: Recipe
    
    var body: some View {
        HStack{
            RecipeRemoteImage(urlString: cusine.photo_url_small!)
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .cornerRadius(20)
            
            VStack(alignment: .leading, spacing: 5){
                Text(cusine.name)
                    .font(.title3)
                    .fontWeight(.medium)
                Text(cusine.cuisine! )
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    RecipeListViewCell(cusine: mockData.sampleData)
}