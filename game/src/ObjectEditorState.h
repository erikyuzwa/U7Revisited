#ifndef _OBJECTEDITORSTATE_H_
#define _OBJECTEDITORSTATE_H_

#include "Geist/State.h"
#include "Geist/Gui.h"
#include <list>
#include <deque>
#include <math.h>

class ObjectEditorState : public State
{
public:
   ObjectEditorState(){};
   ~ObjectEditorState();


   virtual void Init(const std::string& configfile);
   virtual void Shutdown();
   virtual void Update();
   virtual void Draw();

   virtual void OnEnter();
   virtual void OnExit();
   
   unsigned int m_currentShape = 0;
   unsigned int m_currentFrame = 0;
   bool m_rotating = false;
   bool m_tileX = false;
   bool m_tileZ = false;
   bool m_shapeTableMade = false;
   float m_rotateAngle = 0.0;

   std::vector<std::vector<std::unique_ptr<U7Object>>> m_objectLibrary;



   std::unique_ptr<Gui> m_gui;

   std::string m_sideDrawStrings[7];
   std::string m_sideStrings[6];

   // DEEP BREATH

   enum GuiElements
   {
      GE_TITLETEXT = 0,

      GE_PANELBORDER,
      GE_PANEL,

      GE_PREVSHAPEBUTTON,
      GE_NEXTSHAPEBUTTON,
      GE_CURRENTSHAPEIDTEXTAREA,

      GE_PREVFRAMEBUTTON,
      GE_NEXTFRAMEBUTTON,
      GE_CURRENTFRAMEIDTEXTAREA,

      GE_PREVDRAWTYPEBUTTON,
      GE_NEXTDRAWTYPEBUTTON,
      GE_CURRENTDRAWTYPETEXTAREA,

      GE_TOPTEXTAREA,
      GE_TOPRESET,
      GE_TOPXPLUSBUTTON,
      GE_TOPXMINUSBUTTON,
      GE_TOPXTEXTAREA,
      GE_TOPYPLUSBUTTON,
      GE_TOPYMINUSBUTTON,
      GE_TOPYTEXTAREA,
      GE_TOPWIDTHPLUSBUTTON,
      GE_TOPWIDTHMINUSBUTTON,
      GE_TOPWIDTHTEXTAREA,
      GE_TOPHEIGHTPLUSBUTTON,
      GE_TOPHEIGHTMINUSBUTTON,
      GE_TOPHEIGHTTEXTAREA,

      GE_FRONTTEXTAREA,
      GE_FRONTRESET,
      GE_FRONTXPLUSBUTTON,
      GE_FRONTXMINUSBUTTON,
      GE_FRONTXTEXTAREA,
      GE_FRONTYPLUSBUTTON,
      GE_FRONTYMINUSBUTTON,
      GE_FRONTYTEXTAREA,
      GE_FRONTWIDTHPLUSBUTTON,
      GE_FRONTWIDTHMINUSBUTTON,
      GE_FRONTWIDTHTEXTAREA,
      GE_FRONTHEIGHTPLUSBUTTON,
      GE_FRONTHEIGHTMINUSBUTTON,
      GE_FRONTHEIGHTTEXTAREA,

      GE_RIGHTTEXTAREA,
      GE_RIGHTRESET,
      GE_RIGHTXPLUSBUTTON,
      GE_RIGHTXMINUSBUTTON,
      GE_RIGHTXTEXTAREA,
      GE_RIGHTYPLUSBUTTON,
      GE_RIGHTYMINUSBUTTON,
      GE_RIGHTYTEXTAREA,
      GE_RIGHTWIDTHPLUSBUTTON,
      GE_RIGHTWIDTHMINUSBUTTON,
      GE_RIGHTWIDTHTEXTAREA,
      GE_RIGHTHEIGHTPLUSBUTTON,
      GE_RIGHTHEIGHTMINUSBUTTON,
      GE_RIGHTHEIGHTTEXTAREA,

      GE_FRONTSIDETEXTAREA,
      GE_RIGHTSIDETEXTAREA,
      GE_TOPSIDETEXTAREA,
      GE_BACKSIDETEXTAREA,
      GE_LEFTSIDETEXTAREA,
      GE_BOTTOMSIDETEXTAREA,

      GE_NEXTFRONTBUTTON,
      GE_NEXTRIGHTBUTTON,
      GE_NEXTTOPBUTTON,
      GE_NEXTBACKBUTTON,
      GE_NEXTLEFTBUTTON,
      GE_NEXTBOTTOMBUTTON,

      GE_PREVFRONTBUTTON,
      GE_PREVRIGHTBUTTON,
      GE_PREVTOPBUTTON,
      GE_PREVBACKBUTTON,
      GE_PREVLEFTBUTTON,
      GE_PREVBOTTOMBUTTON,

      GE_FRONTSIDETEXTURETEXTAREA,
      GE_RIGHTSIDETEXTURETEXTAREA,
      GE_TOPSIDETEXTURETEXTAREA,
      GE_BACKSIDETEXTURETEXTAREA,
      GE_LEFTSIDETEXTURETEXTAREA,
      GE_BOTTOMSIDETEXTURETEXTAREA,

      GE_SAVEBUTTON,
      GE_LOADBUTTON,

      GE_LASTGUIELEMENT
   };

};

#endif