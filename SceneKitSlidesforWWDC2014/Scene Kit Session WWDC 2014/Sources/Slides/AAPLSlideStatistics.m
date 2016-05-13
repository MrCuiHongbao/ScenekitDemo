/*
 <codex>
 <abstract>Illustrates the new API giving statistics about the scene.</abstract>
 </codex>
 */

#import "AAPLPresentationViewController.h"
#import "AAPLSlideTextManager.h"
#import "AAPLSlide.h"
#import "Utils.h"

@interface AAPLSlideStatistics : AAPLSlide
@end

@implementation AAPLSlideStatistics {
    SCNNode *_fpsNode;
    SCNNode *_panelNode;
    SCNNode *_buttonNode;
    SCNNode *_windowNode;
}

- (NSUInteger)numberOfSteps {
    return 6;
}

- (void)presentStepIndex:(NSUInteger)index withPresentationViewController:(AAPLPresentationViewController *)presentationViewController {
    switch (index) {
        case 0:
        {
            // Set the slide's title and subtile and add some code
            self.textManager.title = @"Performance";
            self.textManager.subtitle = @"Statistics";
            
            [self.textManager addCode:
             @"// Show statistics \n"
             @"aSCNView.#showsStatistics# = YES;"];
            break;
        }
        case 1:
        {
            // Place a screenshot in the scene and animate it
            _windowNode = [SCNNode asc_planeNodeWithImageNamed:@"statistics" size:20 isLit:YES];
            [self.contentNode addChildNode:_windowNode];
            
            _windowNode.opacity = 0.0;
            _windowNode.position = SCNVector3Make(20, 5.4, 9);
            _windowNode.rotation = SCNVector4Make(0, 1, 0, -M_PI_4);
            
            [SCNTransaction begin];
            [SCNTransaction setAnimationDuration:1.0];
            {
                _windowNode.opacity = 1.0;
                _windowNode.position = SCNVector3Make(0, 5.4, 7);
                _windowNode.rotation = SCNVector4Make(0, 1, 0, 0);
            }
            [SCNTransaction commit];
            
            // The screenshot contains transparent areas so we need to make sure it is rendered
            // after the text (which also sets its rendering order)
            _windowNode.renderingOrder = 2;
            
            break;
        }
        case 2:
        {
            _fpsNode = [SCNNode asc_planeNodeWithImageNamed:@"statistics-fps" size:7 isLit:NO];
            [_windowNode addChildNode:_fpsNode];
            
            _fpsNode.scale = SCNVector3Make(0.75, 0.75, 0.75);
            _fpsNode.opacity = 0.0;
            _fpsNode.position = SCNVector3Make(-6, -3, 0.5);
            _fpsNode.renderingOrder = 4;
            
            [SCNTransaction begin];
            [SCNTransaction setAnimationDuration:0.5];
            {
                _fpsNode.scale = SCNVector3Make(1.0, 1.0, 1.0);
                _fpsNode.opacity = 1.0;
            }
            [SCNTransaction commit];
            break;
        }
        case 3:
        {
            _buttonNode = [SCNNode asc_planeNodeWithImageNamed:@"statistics-button" size:4 isLit:NO];
            [_windowNode addChildNode:_buttonNode];
            
            _buttonNode.scale = SCNVector3Make(0.75, 0.75, 0.75);
            _buttonNode.opacity = 0.0;
            _buttonNode.position = SCNVector3Make(-7.5, -2.75, 0.5);
            _buttonNode.renderingOrder = 5;

            [SCNTransaction begin];
            [SCNTransaction setAnimationDuration:0.5];
            {
                _fpsNode.opacity = 0.0;
                _buttonNode.scale = SCNVector3Make(1.0, 1.0, 1.0);
                _buttonNode.opacity = 1.0;
            }
            [SCNTransaction commit];
            break;
        }
        case 4:
        {
            _panelNode = [SCNNode asc_planeNodeWithImageNamed:@"control-panel" size:10 isLit:NO];
            [_windowNode addChildNode:_panelNode];
            
            _panelNode.scale = SCNVector3Make(0.75, 0.75, 0.75);
            _panelNode.opacity = 0.0;
            _panelNode.position = SCNVector3Make(3.5, -0.5, 1.5);
            _panelNode.renderingOrder = 6;
            
            [SCNTransaction begin];
            [SCNTransaction setAnimationDuration:0.5];
            {
                _panelNode.scale = SCNVector3Make(1.0, 1.0, 1.0);
                _panelNode.opacity = 1.0;
            }
            [SCNTransaction commit];
            break;
        }
        case 5:
        {
            SCNNode *detailsNode = [SCNNode asc_planeNodeWithImageNamed:@"statistics-detail" size:9 isLit:NO];
            [_windowNode addChildNode:detailsNode];
            
            detailsNode.scale = SCNVector3Make(0.75, 0.75, 0.75);
            detailsNode.opacity = 0.0;
            detailsNode.position = SCNVector3Make(5, -2.75, 1.5);
            detailsNode.renderingOrder = 7;
            
            [SCNTransaction begin];
            [SCNTransaction setAnimationDuration:0.5];
            {
                _panelNode.opacity = 0.0;
                _buttonNode.opacity = 0.0;
                
                detailsNode.scale = SCNVector3Make(1.0, 1.0, 1.0);
                detailsNode.opacity = 1.0;
            }
            [SCNTransaction commit];
            break;
        }
    }
}

@end
