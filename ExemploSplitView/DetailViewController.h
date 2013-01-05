//
//  DetailViewController.h
//  ExemploSplitView
//
//  Created by Rafael Brigagão Paulino on 27/09/12.
//  Copyright (c) 2012 rafapaulino.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

//centro de tudo por ele que as informacoes sao passadas
//propriedade por onde o master passa dados para o detail
@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UIImageView *imgvFoto;
@property (weak, nonatomic) IBOutlet UILabel *nome;
@property (weak, nonatomic) IBOutlet UILabel *pais;
@property (weak, nonatomic) IBOutlet UILabel *estilo;

//nao usaremos a label neste projeto
//@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
