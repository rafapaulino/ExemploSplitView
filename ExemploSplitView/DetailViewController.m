//
//  DetailViewController.m
//  ExemploSplitView
//
//  Created by Rafael Brigagão Paulino on 27/09/12.
//  Copyright (c) 2012 rafapaulino.com. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item
@synthesize imgvFoto = _imgvFoto;
@synthesize nome = _nome;
@synthesize pais = _pais;
@synthesize estilo = _estilo;


//setter da propriedade detailItem - que é acionado sempre quando ela é setada
- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

//metodo chamado sempre quando um novo conteudo aparece na propriedade detailvieItem
//onde setaremos os dados dos elementos visuais datela
- (void)configureView
{
    // Update the user interface for the detail item.

    /*
     a label nao sera utilizada no projeto
     if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
     */
    //verificar se realmente tem algo dentro da propriedade
    if (self.detailItem)
    {
        NSMutableDictionary *dictComp = self.detailItem;
        _nome.text = [dictComp objectForKey:@"nome"];
        _estilo.text = [dictComp objectForKey:@"estilo"];
        _pais.text = [dictComp objectForKey:@"pais"];
        _imgvFoto.image = [UIImage imageNamed:[dictComp objectForKey:@"foto"]];
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)viewDidUnload
{
    [self setImgvFoto:nil];
    [self setNome:nil];
    [self setPais:nil];
    [self setEstilo:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
