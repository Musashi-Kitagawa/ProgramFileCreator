unit ScreenDbUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,  System.StrUtils, System.Contnrs, System.Types,
  Xml.XMLDoc, Xml.XMLIntf, Vcl.StdCtrls, Vcl.ExtCtrls,
//
    CommonUnit;

const
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    FScreenDbTable : array [0..11] of string = (
        'UiFrame',                          // 0
        'UiScreenSelectButton',             // 1
        'UiList',                           // 2
        'UiListColumn',                     // 3
        'UiContent',                        // 4
        'UiListCellButton',                 // 5
        'UiDstButton',                      // 6
        'UiSrcButton',                      // 7
        'UiPanelKeyButton',                 // 8
        'UiPanelDstButton',                 // 9
        'UiPanelSrcButton',                 // 10
        'UiColorSrcKeyButton'               // 11
    );

    UiFrame_No                  = 0;
    UiScreenSelectButton_No     = 1;
    UiList_No                   = 2;
    UiListColumn_No             = 3;
    UiContent_No                = 4;
    UiListCellButton_No         = 5;
    UiDstButton_No              = 6;
    UiSrcButton_No              = 7;
    UiPanelKeyButton_No         = 8;
    UiPanelDstButton_No         = 9;
    UiPanelSrcButton_No         = 10;
    UiColorSrcKeyButton_No      = 11;

type
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TScreenDb = class( TObject )

        FDataType   : integer;

        F_Id    : integer;
        E_Id    : Boolean;

//        FPanel  : TPanel;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

//        function    Clone : TScreenDb;

//        procedure   SetPosition( pa : TWinControl; rct : TRect; cap : string );

        function    Clone( src : TScreenDb=nil ) : TScreenDb;

        function    IsSame( b : TScreenDb ) : Boolean;

    end;

    TUiButton = TScreenDb;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TUiFrame = class( TScreenDb )

        F_Note              : string;
        E_Note              : Boolean;

        F_ParentFrameId     : string;
        E_ParentFrameId     : Boolean;

        F_TitleText         : string;
        E_TitleText         : Boolean;

        F_TitleBarHeightPix : string;
        E_TitleBarHeightPix : Boolean;

        F_TitleBarVisible   : string;
        E_TitleBarVisible   : Boolean;

        F_BackColor         : string;
        E_BackColor         : Boolean;

        F_Type              : string;
        E_Type              : Boolean;

        F_Name              : string;
        E_Name              : Boolean;

        F_Attribute         : string;
        E_Attribute         : Boolean;

        F_ColCount          : string;
        E_ColCount          : Boolean;

        F_RowCount          : string;
        E_RowCount          : Boolean;

        F_IsModal           : string;
        E_IsModal           : Boolean;

        F_Order             : string;
        E_Order             : Boolean;

        F_InnerOrder        : string;
        E_InnerOrder        : Boolean;

        F_Left              : string;
        E_Left              : Boolean;

        F_Width             : string;
        E_Width             : Boolean;

        F_Top               : string;
        E_Top               : Boolean;

        F_Height            : string;
        E_Height            : Boolean;

        F_BorderWidth       : string;
        E_BorderWidth       : Boolean;

        F_BorderColor       : string;
        E_BorderColor       : Boolean;


  	public
        // コンストラクタ
        constructor Create; override;

        // デストラクタ
        destructor 	Destroy; override;

        function    Clone( src : TUiFrame=nil ) : TUiFrame;

    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TUiScreenSelectButton = class( TScreenDb )
        F_FrameId       : string;
        E_FrameId       : Boolean;

        F_Text          : string;
        E_Text          : Boolean;

        F_Key           : string;
        E_Key           : Boolean;

        F_FrameName     : string;
        E_FrameName     : Boolean;

        F_BeforeRelayKey        : string;
        E_BeforeRelayKey        : Boolean;

        F_Attributes    : string;
        E_Attributes    : Boolean;

        F_Order         : string;
        E_Order         : Boolean;

        F_Left          : string;
        E_Left          : Boolean;

        F_Width         : string;
        E_Width         : Boolean;

        F_Top           : string;
        E_Top           : Boolean;

        F_Height        : string;
        E_Height        : Boolean;

        F_BorderWidth   : string;
        E_BorderWidth   : Boolean;

        F_IncludeHeadbar        : string;
        E_IncludeHeadbar        : Boolean;

        F_HeadbarColor          : string;
        E_HeadbarColor          : Boolean;

        F_HeadbarHeight         : string;
        E_HeadbarHeight         : Boolean;

        F_HeadbarText           : string;
        E_HeadbarText           : Boolean;

        F_HeadbarFontSize       : string;
        E_HeadbarFontSize       : Boolean;

        F_IsPermissionHandled   : string;
        E_IsPermissionHandled   : Boolean;

        F_IsSelectionCancel     : string;
        E_IsSelectionCancel     : Boolean;

        F_FontSize              : string;
        E_FontSize              : Boolean;

        F_IsDisabled            : string;
        E_IsDisabled            : Boolean;

        F_IsListItem            : string;
        E_IsListItem            : Boolean;

  	public
        // コンストラクタ
        constructor Create; override;

        // デストラクタ
        destructor 	Destroy; override;

        function    Clone( src : TUiScreenSelectButton=nil ) : TUiScreenSelectButton;
    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TUiList = class( TScreenDb )

        F_FrameId   : string;
        E_FrameId   : Boolean;

        F_ListType     : string;
        E_ListType     : Boolean;

        F_Attributes     : string;
        E_Attributes     : Boolean;

        F_DefaultSortColumnName     : string;
        E_DefaultSortColumnName     : Boolean;

        F_AllowMultiSort     : string;
        E_AllowMultiSort     : Boolean;

        F_FilterButtonWidth     : string;
        E_FilterButtonWidth     : Boolean;

        F_RowHeight     : string;
        E_RowHeight     : Boolean;

        F_RowHeaderColumnName     : string;
        E_RowHeaderColumnName     : Boolean;

        F_RowHeaderClickAction     : string;
        E_RowHeaderClickAction     : Boolean;

        F_ColumnFontSize     : string;
        E_ColumnFontSize     : Boolean;

        F_CellFontSize     : string;
        E_CellFontSize     : Boolean;

        F_Order     : string;
        E_Order     : Boolean;

        F_Left      : string;
        E_Left      : Boolean;

        F_Width     : string;
        E_Width     : Boolean;

        F_Top       : string;
        E_Top       : Boolean;

        F_Height    : string;
        E_Height    : Boolean;

  	public
        // コンストラクタ
        constructor Create; override;

        // デストラクタ
        destructor 	Destroy; override;

        function    Clone( src : TUiList=nil ) : TUiList;

    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TUiListColumn = class( TScreenDb )

        F_ListId    : string;
        E_ListId    : Boolean;

        F_Order     : string;
        E_Order     : Boolean;

        F_SortOrder     : string;
        E_SortOrder     : Boolean;

        F_Width     : string;
        E_Width     : Boolean;

        F_IsVisible : string;
        E_IsVisible : Boolean;

        F_IsReadOnly        : string;
        E_IsReadOnly        : Boolean;

        F_Text          : string;
        E_Text          : Boolean;

        F_ColName       : string;
        E_ColName       : Boolean;

        F_ColAlias  : string;
        E_ColAlias       : Boolean;

        F_ColHeaderClickAction  : string;
        E_ColHeaderClickAction  : Boolean;

        F_CellType      : string;
        E_CellType      : Boolean;

        F_EnumTypeName      : string;
        E_EnumTypeName      : Boolean;

        F_Format      : string;
        E_Format      : Boolean;

        F_Attribute      : string;
        E_Attribute      : Boolean;

        F_AllowSort     : string;
        E_AllowSort     : Boolean;

        F_AllowFilter   : string;
        E_AllowFilter   : Boolean;

        F_AllowWideChar     : string;
        E_AllowWideChar     : Boolean;

        F_MaxLangth         : string;
        E_MaxLangth         : Boolean;

        F_MaxLengthIsBytes  : string;
        E_MaxLengthIsBytes  : Boolean;

        F_DisplayMaxLineCount    : string;
        E_DisplayMaxLineCount    : Boolean;

        F_ColumnFontSize    : string;
        E_ColumnFontSize    : Boolean;

        F_CellFontSize      : string;
        E_CellFontSize      : Boolean;

        F_CellTextHAlign    : string;
        E_CellTextHAlign    : Boolean;

        F_CanReEntry        : string;
        E_CanReEntry        : Boolean;

        F_IsCellButtonCol   : string;
        E_IsCellButtonCol   : Boolean;

        F_IsRowSelectSync   : string;
        E_IsRowSelectSync   : Boolean;

        F_BoolTrueText      : string;
        E_BoolTrueText      : Boolean;

        F_BoolFalseText     : string;
        E_BoolFalseText     : Boolean;

        F_IsFontSizeAdjustable     : string;
        E_IsFontSizeAdjustable     : Boolean;

        F_FooterText        : string;
        E_FooterText        : Boolean;

  	public
        // コンストラクタ
        constructor Create; override;

        // デストラクタ
        destructor 	Destroy; override;

        function    Clone( src : TUiListColumn=nil ) : TUiListColumn;

    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TUiContent = class( TScreenDb )

        F_FrameId   : string;
        E_FrameId   : Boolean;

        F_Text  : string;
        E_Text  : Boolean;

        F_UiType    : string;
        E_UiType    : Boolean;

        F_Name    : string;
        E_Name    : Boolean;

        F_Attributes    : string;
        E_Attributes    : Boolean;


        F_Order : string;
        E_Order : Boolean;

        F_Left  : string;
        E_Left  : Boolean;

        F_Width : string;
        E_Width : Boolean;

        F_Top   : string;
        E_Top   : Boolean;

        F_Height    : string;
        E_Height    : Boolean;

        F_BorderWidth    : string;
        E_BorderWidth    : Boolean;

  	public
        // コンストラクタ
        constructor Create; override;

        // デストラクタ
        destructor 	Destroy; override;

    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TUiListCellButton = class( TScreenDb )

        F_ColumnId  : string;
        E_ColumnId  : Boolean;

        F_Order : string;
        E_Order : Boolean;

        F_Width : string;
        E_Width : Boolean;

        F_Text  : string;
        E_Text  : Boolean;

        F_ClickAction   : string;
        E_ClickAction   : Boolean;

        F_IsDefaultRowVisible   : string;
        E_IsDefaultRowVisible   : Boolean;

        F_IsStandartRowVisible  : string;
        E_IsStandartRowVisible  : Boolean;

        F_FontSize          : string;
        E_FontSize          : Boolean;

        F_IsRowSelectSync   : string;
        E_IsRowSelectSync   : Boolean;

        F_HeadbarHeight     : string;
        E_HeadbarHeight     : Boolean;


  	public
        // コンストラクタ
        constructor Create; override;

        // デストラクタ
        destructor 	Destroy; override;

        function    Clone( src : TUiListCellButton=nil ) : TUiListCellButton;
    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TUiDstButton = class( TScreenDb )

        F_FrameId   : string;
        E_FrameId   : Boolean;

        F_DstPortNo : string;
        E_DstPortNo : Boolean;

        F_IsListItem : string;
        E_IsListItem : Boolean;

        F_DstHeightPx : string;
        E_DstHeightPx : Boolean;

        F_FontSize : string;
        E_FontSize : Boolean;

        F_Order : string;
        E_Order : Boolean;

        F_Left  : string;
        E_Left  : Boolean;

        F_Width : string;
        E_Width : Boolean;

        F_Top   : string;
        E_Top   : Boolean;

        F_Height            : string;
        E_Height            : Boolean;

        F_BorderWidth       : string;
        E_BorderWidth       : Boolean;

        F_IsDisabled        : string;
        E_IsDisabled        : Boolean;

        F_SystemModeBitMask : string;
        E_SystemModeBitMask : Boolean;

        F_Attrubute         : string;
        E_Attrubute         : Boolean;

        F_IsHeadBarHidden   : string;
        E_IsHeadBarHidden   : Boolean;

        F_DstFontSize       : string;
        E_DstFontSize       : Boolean;


  	public
        // コンストラクタ
        constructor Create; override;

        // デストラクタ
        destructor 	Destroy; override;

        function    Clone( src : TUiDstButton=nil ) : TUiDstButton;
    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TUiSrcButton = class( TScreenDb )

        F_FrameId   : string;
        E_FrameId   : Boolean;

        F_SrcPortNo : string;
        E_SrcPortNo : Boolean;

        F_Order : string;
        E_Order : Boolean;

        F_Left  : string;
        E_Left  : Boolean;

        F_Width : string;
        E_Width : Boolean;

        F_Top   : string;
        E_Top   : Boolean;

        F_Height    : string;
        E_Height    : Boolean;

        F_SystemModeBitMask    : string;
        E_SystemModeBitMask    : Boolean;

        F_FontSize      : string;
        E_FontSize      : Boolean;

        F_Attribute     : string;
        E_Attribute     : Boolean;

  	public
        // コンストラクタ
        constructor Create; override;

        // デストラクタ
        destructor 	Destroy; override;

        function    Clone( src : TUiSrcButton=nil ) : TUiSrcButton;
    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TUiPanelKeyButton = class( TScreenDb )

        F_FrameId   : string;
        E_FrameId   : Boolean;

        F_ButtonNo  : string;
        E_ButtonNo  : Boolean;

        F_DstAssignDisable  : string;
        E_DstAssignDisable  : Boolean;

        F_SrcAssignDisable  : string;
        E_SrcAssignDisable  : Boolean;

        F_CopyButtonNo  : string;
        E_CopyButtonNo  : Boolean;

        F_SyncPageRange : string;
        E_SyncPageRange : Boolean;

        F_DispMode : string;
        E_DispMode : Boolean;

        F_Order : string;
        E_Order : Boolean;

        F_Left  : string;
        E_Left  : Boolean;

        F_Width : string;
        E_Width : Boolean;

        F_Top   : string;
        E_Top   : Boolean;

        F_Height    : string;
        E_Height    : Boolean;

  	public
        // コンストラクタ
        constructor Create; override;

        // デストラクタ
        destructor 	Destroy; override;

        function    Clone( src : TUiPanelKeyButton=nil ) : TUiPanelKeyButton;
    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TUiPanelDstButton = class( TScreenDb )

        F_FrameId       : string;
        E_FrameId       : Boolean;

        F_DstPortNo     : string;
        E_DstPortNo     : Boolean;

        F_Order         : string;
        E_Order         : Boolean;

        F_Left          : string;
        E_Left          : Boolean;

        F_Width         : string;
        E_Width         : Boolean;

        F_Top           : string;
        E_Top           : Boolean;

        F_Height        : string;
        E_Height        : Boolean;

        F_BorderWidth   : string;
        E_BorderWidth   : Boolean;

        F_SystemModeBitMask : string;
        E_SystemModeBitMask : Boolean;

  	public
        // コンストラクタ
        constructor Create; override;

        // デストラクタ
        destructor 	Destroy; override;

        function    Clone( src : TUiPanelDstButton=nil ) : TUiPanelDstButton;
    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TUiPanelSrcButton = class( TScreenDb )

        F_FrameId       : string;
        E_FrameId       : Boolean;

        F_SrcPortNo     : string;
        E_SrcPortNo     : Boolean;

        F_Order         : string;
        E_Order         : Boolean;

        F_Left          : string;
        E_Left          : Boolean;

        F_Width         : string;
        E_Width         : Boolean;

        F_Top           : string;
        E_Top           : Boolean;

        F_Height        : string;
        E_Height        : Boolean;

        F_SystemModeBitMask : string;
        E_SystemModeBitMask : Boolean;

  	public
        // コンストラクタ
        constructor Create; override;

        // デストラクタ
        destructor 	Destroy; override;

        function    Clone( src : TUiPanelSrcButton=nil ) : TUiPanelSrcButton;
    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TUiColorSrcKeyButton = class( TScreenDb )

        F_FrameId   : string;
        E_FrameId   : Boolean;

        F_SrcPortNo : string;
        E_SrcPortNo : Boolean;

        F_Order : string;
        E_Order : Boolean;

        F_Left  : string;
        E_Left  : Boolean;

        F_Width : string;
        E_Width : Boolean;

        F_Top   : string;
        E_Top   : Boolean;

        F_Height    : string;
        E_Height    : Boolean;

  	public
        // コンストラクタ
        constructor Create; override;

        // デストラクタ
        destructor 	Destroy; override;

    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TScreenList = class( TObjectList )
    private

	  	function    GetData( index : integer ) : TScreenDb;

        function    UiFrameLoad( cnl : IXMLNodeList ) : TUiFrame;
        procedure   UiFrameSave( XML_Doc : IXMLDocument; u : TUiFrame );
        function    UiScreenSelectButtonLoad( cnl : IXMLNodeList ) : TUiScreenSelectButton;
        procedure   UiScreenSelectButtonSave( XML_Doc : IXMLDocument; u : TUiScreenSelectButton );
        function    UiListLoad( cnl : IXMLNodeList ) : TUiList;
        procedure   UiListSave( XML_Doc : IXMLDocument; u : TUiList );
        function    UiListColumnLoad( cnl : IXMLNodeList ) : TUiListColumn;
        procedure   UiListColumnSave( XML_Doc : IXMLDocument; u : TUiListColumn );
        function    UiContentLoad( cnl : IXMLNodeList ) : TUiContent;
        procedure   UiContentSave( XML_Doc : IXMLDocument; u : TUiContent );
        function    UiListCellButtonLoad( cnl : IXMLNodeList ) : TUiListCellButton;
        procedure   UiListCellButtonSave( XML_Doc : IXMLDocument; u : TUiListCellButton );
        function    UiDstButtonLoad( cnl : IXMLNodeList ) : TUiDstButton;
        procedure   UiDstButtonSave( XML_Doc : IXMLDocument; u : TUiDstButton );
        function    UiSrcButtonLoad( cnl : IXMLNodeList ) : TUiSrcButton;
        procedure   UiSrcButtonSave( XML_Doc : IXMLDocument; u : TUiSrcButton );
        function    UiPanelKeyButtonLoad( cnl : IXMLNodeList ) : TUiPanelKeyButton;
        procedure   UiPanelKeyButtonSave( XML_Doc : IXMLDocument; u : TUiPanelKeyButton );
        function    UiPanelDstButtonLoad( cnl : IXMLNodeList ) : TUiPanelDstButton;
        procedure   UiPanelDstButtonSave( XML_Doc : IXMLDocument; u : TUiPanelDstButton );
        function    UiPanelSrcButtonLoad( cnl : IXMLNodeList ) : TUiPanelSrcButton;
        procedure   UiPanelSrcButtonSave( XML_Doc : IXMLDocument; u : TUiPanelSrcButton );
        function    UiColorSrcKeyButtonLoad( cnl : IXMLNodeList ) : TUiColorSrcKeyButton;
        procedure   UiColorSrcKeyButtonSave( XML_Doc : IXMLDocument; u : TUiColorSrcKeyButton );

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        function    ScreenDbLoad( fn : string ) : Boolean;
        procedure   ScreenDbSave( fn : string );

//       function    GetChildFrame( id : integer ) : integer;

        function    Search( bType, bId : integer ) : TScreenDb;
        function    SearchByName( bType : integer; nm : string ) : TScreenDb;
        function    SearchByTitle( bType : integer; ttl : string ) : TScreenDb;
        function    SearchList( id : string ) : TUiList;
        function    SearchButton( bType : integer; bId : string; lst : TScreenList ) : integer; overload;
        function    SearchButton( bType : integer; bId : string ) : TUiScreenSelectButton; overload;
        function    SearchParent( bType : integer; bId : string; lst : TScreenList ) : integer;
        function    SearchSource( bType : integer; bId : string; lst : TScreenList ) : integer;
        function    SearchType( bType : integer; lst : TScreenList ) : integer;
        function    SearchByListType( ttl : string; lst : TScreenList ) : integer;

        function    NewId( dtype : integer ) : integer;

		procedure   ClearAll;
        procedure   AllExtract( opt : integer=0 );
//        procedure   AllExtract2;
        procedure   AllExtract3;

        procedure   Empty;

        procedure   SortDataType;

        // リストから削除
        procedure   DeleteButton( btn : TUiButton; opt : integer=0 );

 		property Data[index:integer] : TScreenDb	read GetData;
    end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TDisplayDb = class( TObject )

        FDataType   : integer;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

    const
        typeMessage     = 0;
        typeEnumType    = 1;
        typeEnumValue   = 2;
        typeSetting     = 3;

    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TDisplayMessage = class( TDisplayDb )

        F_Id            : string;
        E_Id            : Boolean;

        F_MessageCode   : string;
        E_MessageCode   : Boolean;

        F_Message       : string;
        E_Message       : Boolean;

        F_Memo          : string;
        E_Memo          : Boolean;


  	public
        // コンストラクタ
        constructor     Create; override;

        // デストラクタ
        destructor 	    Destroy; override;
    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TDisplayEnumType = class( TDisplayDb )

        F_Name      : string;
        E_Name      : Boolean;

        F_Note      : string;
        E_Note      : Boolean;

  	public
        // コンストラクタ
        constructor     Create; override;

        // デストラクタ
        destructor 	    Destroy; override;
    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TDisplayEnumvalue = class( TDisplayDb )

        F_EnumName  : string;
        E_EnumName  : Boolean;

        F_Value     : string;
        E_Value     : Boolean;

        F_Order     : string;
        E_Order     : Boolean;

        F_Text      : string;
        E_Text      : Boolean;

        F_Arrtibute : string;
        E_Arrtibute : Boolean;

        F_Tag       : string;
        E_Tag       : Boolean;

        F_IsHidden  : string;
        E_IsHidden  : Boolean;

  	public
        // コンストラクタ
        constructor     Create; override;

        // デストラクタ
        destructor 	    Destroy; override;
    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TDisplayDspSettings = class( TDisplayDb )

        F_ValueId   : string;
        E_ValueId   : Boolean;

        F_Value     : string;
        E_Value     : Boolean;

        F_Order     : string;
        E_Order     : Boolean;

        F_Note      : string;
        E_Note      : Boolean;

  	public
        // コンストラクタ
        constructor     Create; override;

        // デストラクタ
        destructor 	    Destroy; override;
    end;


//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TDisplayList = class( TObjectList )
    private

	  	function    GetData( index : integer ) : TDisplayDb;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        function    Load( fn : string ) : Boolean;
        procedure   Save( fn : string );

        function    Search( dType : integer; id : string ) : TDisplayDb;

        function    DisplayMessageLoad( cnl : IXMLNodeList ) : TDisplayMessage;
        procedure   DisplayMessageSave( XML_Doc : IXMLDocument; u : TDisplayMessage );
        function    DisplayEmptyTypeLoad( cnl : IXMLNodeList ) : TDisplayEnumType;
        procedure   DisplayEnumTypeSave( XML_Doc : IXMLDocument; u : TDisplayEnumType );
        function    DisplayDisplayEmptyValueLoad( cnl : IXMLNodeList ) : TDisplayEnumValue;
        procedure   DisplayEnumValueSave( XML_Doc : IXMLDocument; u : TDisplayEnumValue );
        function    DisplayDspSettingsLoad( cnl : IXMLNodeList ) : TDisplayDspSettings;
        procedure   DisplayDspSettingsSave( XML_Doc : IXMLDocument; u : TDisplayDspSettings );

		procedure   ClearAll;

 		property Data[index:integer] : TDisplayDb	read GetData;
    end;


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TProgramDbList = class( TObjectList )
    private

//	  	function    GetData( index : integer ) : TXPTSourceData;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

//        function    Search( port : integer ) : string;

		procedure   ClearAll;

//        property    Data[index:integer] : TXPTSourceData	read GetData;
    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TXPTSourceData = class( TObject )
//    private

        F_SrcPortNo               : string;
        F_DefaultDescription      : string;
        F_DefaultDescription4k    : string;
        F_Description             : string;
        F_Description4k           : string;
        F_InputName               : string;
        F_ClipDuration            : string;
        F_NameHeader              : string;
        F_NameFooter              : string;
        F_BusLinkId               : string;
        F_DescriptionLinkId       : string;
        F_DescriptionLinkId4k     : string;
        F_InputNameLinkId         : string;
        F_JMode                   : string;
        F_JLength                 : string;
        F_JDelimiter              : string;
        F_IsNameSendTarget        : string;
        F_DispMode                : string;
        F_DispModeName            : string;
        F_JMode2                  : string;
        F_UseWideChar             : string;

        F_DefaultDescriptionQd    : string;
        F_DescriptionQd           : string;
        F_DefaultInputName        : string;
        F_IsInputNameNameHeaderLinked   : string;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

    end;

    TPgSourceData   = TXPTSourceData;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TXPTSourceList = class( TProgramDbList )
    private

	  	function    GetData( index : integer ) : TXPTSourceData;

  	public
        // コンストラクタ
        constructor Create; override;

        // デストラクタ
        destructor 	Destroy; override;

        function    Search( port : integer ) : string;

		procedure   ClearAll;

 		property    Data[index:integer] : TXPTSourceData	read GetData;
    end;

    TPgSourceList   = TXPTSourceList;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TPgPanelKey = class( TObject )
    private

        FDeviceId       : string;
        FPageNo         : integer;
        FKeyNo          : string;
        FKeyType        : string;
        FValue          : string;
        FIsInhibit      : string;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        property    DeviceId : string   read FDeviceId  write FDeviceId;
        property    PageNo : integer    read FPageNo    write FPageNo;
        property    KeyNo : string      read FKeyNo     write FKeyNo;
        property    KeyType : string    read FKeyType   write FKeyType;
        property    Value : string      read FValue     write FValue;
        property    IsInhibit : string  read FIsInhibit write FIsInhibit;
    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TPgPanelKeyList = class( TObjectList )

 	  	function    GetData( index : integer ) : TPgPanelKey;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

 		property    Data[index:integer] : TPgPanelKey	read GetData;
    end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TPgDeviceData = class( TObject )
    private

        FDeviceId       : string;
        FDeviceTypeName : string;
        FBkupDateTime   : string;

        FPage           : array [0..31] of TPgPanelKeyList;

        function    GetPage( index : integer ) : TPgPanelKeyList;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        property    DeviceId  : string          read FDeviceId          write FDeviceId;
        property    DeviceTypeName  : string    read FDeviceTypeName    write FDeviceTypeName;
        property    BkupDateTime  : string      read FBkupDateTime      write FBkupDateTime;

        property    Page[index:integer] : TPgPanelKeyList   read GetPage;

    const
        MAX_PAGE    = 32;

    end;


//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TPgMvDstButton = class( TObject )
//    private

        F_Id          : string;
        F_FrameId     : string;
        F_PresetNo    : string;
        F_DstPortNo   : string;
        F_Order       : string;
        F_Left        : string;
        F_Width       : string;
        F_Top         : string;
        F_Height      : string;


//        function    GetPage( index : integer ) : TPgPanelKeyList;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

{
        property    DeviceId  : string          read FDeviceId          write FDeviceId;
        property    DeviceTypeName  : string    read FDeviceTypeName    write FDeviceTypeName;
        property    BkupDateTime  : string      read FBkupDateTime      write FBkupDateTime;

        property    Page[index:integer] : TPgPanelKeyList   read GetPage;

    const
        MAX_PAGE    = 32;
}

    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TPgDeviceList = class( TProgramDbList )
    private

	  	function    GetData( index : integer ) : TPgDeviceData;

  	public
        // コンストラクタ
        constructor Create; override;

        // デストラクタ
        destructor 	Destroy; override;

        function    SearchDeviceID( id : string ) : TPgDeviceData;

//        function    Search( port : integer ) : string;
//		procedure   ClearAll;

 		property    Data[index:integer] : TPgDeviceData	read GetData;
    end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TPgDestinationData = class( TObject )
//    private

        F_DstPortNo               : string;
        F_DefaultDescription      : string;
        F_DefaultDescription4k    : string;
        F_Description             : string;
        F_Description4k           : string;
        F_InputName               : string;
        F_DescriptionLinkId       : string;
        F_InputNameLinkId         : string;
        F_JMode                   : string;
        F_JLength                 : string;
        F_JDelimiter              : string;
        F_IsNameSendTarget        : string;
        F_JMode2                  : string;
        F_UseWideChar             : string;

        F_DefaultDescriptionQd    : string;
        F_DescriptionQd           : string;
        F_DefaultInputName        : string;
        F_IsXptSendTarget         : string;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TPgDestinationList = class( TProgramDbList )
    private

	  	function    GetData( index : integer ) : TPgDestinationData;

  	public
        // コンストラクタ
        constructor Create; override;

        // デストラクタ
        destructor 	Destroy; override;

        function    Search( port : string ) : string;
//        function    SearchDeviceID( id : string ) : TPgDeviceData;
//		procedure   ClearAll;
//        function    Load( fn : string ) : Boolean;

 		property    Data[index:integer] : TPgDestinationData	read GetData;
    end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TPgCrossPoint = class( TObject )
//    private

        F_DstPortNo             : string;
        F_Level                 : string;
        F_SrcPortNo             : string;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;
    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TPgCrossPointList = class( TProgramDbList )
    private

	  	function    GetData( index : integer ) : TPgCrossPoint;

  	public
        // コンストラクタ
        constructor Create; override;

        // デストラクタ
        destructor 	Destroy; override;

//        function    Load( fn : string ) : Boolean;
//        function    Search( port : string ) : string;
//        function    SearchDeviceID( id : string ) : TPgDeviceData;
//		procedure   ClearAll;

 		property    Data[index:integer] : TPgCrossPoint	read GetData;
    end;


//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TPgMultiViewList = class( TProgramDbList )
    private

	  	function    GetData( index : integer ) : TPgMvDstButton;

  	public
        // コンストラクタ
        constructor Create; override;

        // デストラクタ
        destructor 	Destroy; override;

//        function    Load( fn : string ) : Boolean;
//        function    Search( port : string ) : string;
//        function    SearchDeviceID( id : string ) : TPgDeviceData;
//		procedure   ClearAll;

 		property    Data[index:integer] : TPgMvDstButton	read GetData;
    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TProgramDb = class( TObject )
    private

        FSourceList     : TXPTSourceList;
        FDeviceList     : TPgDeviceList;
        FDestList       : TPgDestinationList;
        FCrosspointList : TPgCrossPointList;
        FMultiViewList  : TPgMultiViewList;

        procedure   PgDeviceLoad( cnl : IXMLNodeList );
        procedure   XPTSourceLoad( cnl : IXMLNodeList );
        procedure   PgPanelKeyLoad( cnl : IXMLNodeList );
        procedure   PgDestinationLoad( cnl : IXMLNodeList );
        procedure   PgCrossPointLoad( cnl : IXMLNodeList );
        procedure   PgMvDstButtonLoad( cnl : IXMLNodeList );

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        function    Load( fn : string ) : Boolean;

{
        function    Search( port : integer ) : string;
		procedure   ClearAll;
 		property Data[index:integer] : TXPTSourceData	read GetData;
}

        property    SourceList : TXPTSourceList             read FSourceList;
        property    DeviceList : TPgDeviceList              read FDeviceList;
        property    DestinationList : TPgDestinationList    read FDestList;
        property    CrosspointList : TPgCrossPointList      read FCrosspointList;
        property    MultiViewList : TPgMultiViewList        read FMultiViewList;

    end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TProgramIndex   = class( TObject )

        F_Id                : string;
        E_Id                : Boolean;

        F_CategoryName      : string;
        E_CategoryName      : Boolean;

        F_CategoryName2     : string;
        E_CategoryName2     : Boolean;

        F_CategoryName3     : string;
        E_CategoryName3     : Boolean;

        F_ProgramName       : string;
        E_ProgramName       : Boolean;

        F_IsLocked          : string;
        E_IsLocked          : Boolean;

        F_CreatedDateTime   : string;
        E_CreatedDateTime   : Boolean;

        F_UpdatedDateTime   : string;
        E_UpdatedDateTime   : Boolean;

        F_CategoryOrder     : string;
        E_CategoryOrder     : Boolean;

        F_CategoryOrder2    : string;
        E_CategoryOrder2    : Boolean;

        F_CategoryOrder3    : string;
        E_CategoryOrder3    : Boolean;

        F_ProgramMemo       : string;
        E_ProgramMemo       : Boolean;

        F_ProgramOrder      : string;
        E_ProgramOrder      : Boolean;

        F_SystemMode        : string;
        E_SystemMode        : Boolean;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;
    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TPiCategory   = class( TObject )

        F_Id                : string;
        E_Id                : Boolean;

        F_CategoryName      : string;
        E_CategoryName      : Boolean;

        F_Order             : string;
        E_Order             : Boolean;

  	public
        // コンストラクタ
        constructor     Create; virtual;

        // デストラクタ
        destructor 	    Destroy; override;
    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TProgramIndexList   = class( TObjectList )
    private

        function    GetData( index : integer ) : TProgramIndex;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        procedure   ClearAll;

        property    Data[index:integer] : TProgramIndex       read GetData;

    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TPiCategoryList   = class( TObjectList )
    private

        function    GetData( index : integer ) : TPiCategory;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        procedure   SortOrder;
        procedure   ClearAll;

        function    GetMaxId : string;
        function    GetMaxOrder : string;

        property    Data[index:integer] : TPiCategory       read GetData;
    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TProgramIndexDb = class( TObject )
    private

        FProgramList    : TProgramIndexList;
        FPiCategoryList : array [0..2] of TPiCategoryList;

        procedure   PiCategoryLoad( cnl : IXMLNodeList; cate : integer );
        procedure   ProgramIndexLoad( cnl : IXMLNodeList );

        procedure   PiCategorySave( XML_Doc : IXMLDocument; cate : integer );
        procedure   ProgramIndexSave( XML_Doc : IXMLDocument );

        function    GetPiCategoryList( cate : integer ) : TPiCategoryList;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        function    Load( fn : string ) : Boolean;
        procedure   Save( fn : string );

        property    ProgramList : TProgramIndexList     read FProgramList;
        property    PiCategoryList[cate:integer] : TPiCategoryList    read GetPiCategoryList;

    end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbDevice   = class( TObject )

        F_Id                    : string;
        E_Id                    : Boolean;

        F_StationId             : string;
        E_StationId             : Boolean;

        F_TypeName              : string;
        E_TypeName              : Boolean;

        F_Name                  : string;
        E_Name                  : Boolean;

        F_IpAddress             : string;
        E_IpAddress             : Boolean;

        F_TimeoutMsec           : string;
        E_TimeoutMsec           : Boolean;

        F_IsSendTarget          : string;
        E_IsSendTarget          : Boolean;

        F_IsRecvTarget          : string;
        E_IsRecvTarget          : Boolean;

        F_IsKeyAssign           : string;
        E_IsKeyAssign           : Boolean;

        F_KeyAssignPageCount    : string;
        E_KeyAssignPageCount    : Boolean;

        F_IsEditLocked          : string;
        E_IsEditLocked          : Boolean;

        F_DeviceCategoryName    : string;
        E_DeviceCategoryName    : Boolean;

        F_IsNsbusDevice         : string;
        E_IsNsbusDevice         : Boolean;

        F_Is4kHdChangeSendTarget: string;
        E_Is4kHdChangeSendTarget: Boolean;

        F_ParentStationId       : string;
        E_ParentStationId       : Boolean;

        F_Attribute             : string;
        E_Attribute             : Boolean;

        F_SentSystemMode        : string;
        E_SentSystemMode        : Boolean;

    public

        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbDeviceList = class( TObjectList )
    private

	  	function    GetData( index : integer ) : TSbDevice;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        procedure   ClearAll;

        function    SearchStationId( id : string ) : TSbDevice;

 		property    Data[index:integer] : TSbDevice	read GetData;
    end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbPanelType    = class( TObject )

        F_Id                        : string;
        E_Id                        : Boolean;

        F_Name                      : string;
        E_Name                      : Boolean;

        F_Note                      : string;
        E_Note                      : Boolean;

        F_UiKey                     : string;
        E_UiKey                     : Boolean;

        F_PageCount                 : string;
        E_PageCount                 : Boolean;

        F_HasBusNameLabel           : string;
        E_HasBusNameLabel           : Boolean;

        F_KeyCount                  : string;
        E_KeyCount                  : Boolean;

        F_HasControlDst             : string;
        E_HasControlDst             : Boolean;

        F_CanCdsAssign              : string;
        E_CanCdsAssign              : Boolean;

        F_CanSrcAssign              : string;
        E_CanSrcAssign              : Boolean;

        F_CanDstAssign              : string;
        E_CanDstAssign              : Boolean;

        F_CanFncAssign              : string;
        E_CanFncAssign              : Boolean;

        F_AssignCancelSrcDstGpSel   : string;
        E_AssignCancelSrcDstGpSel   : Boolean;

        F_CdsStartBytes             : string;
        E_CdsStartBytes             : Boolean;

        F_CdsPageByteCount          : string;
        E_CdsPageByteCount          : Boolean;

        F_CdsIsLitteEndian          : string;
        E_CdsIsLitteEndian          : Boolean;

        F_SrcStartBytes             : string;
        E_SrcStartBytes             : Boolean;

        F_SrcPageByteCount          : string;
        E_SrcPageByteCount          : Boolean;

        F_DstStartBytes             : string;
        E_DstStartBytes             : Boolean;

        F_DstPageByteCount          : string;
        E_DstPageByteCount          : Boolean;

        F_IsCdstAutoAssign          : string;
        E_IsCdstAutoAssign          : Boolean;

        F_CanPageCountSetting       : string;
        E_CanPageCountSetting       : Boolean;

        F_CanDstAssignEachPages     : string;
        E_CanDstAssignEachPages     : Boolean;

        F_AvailablePageStartBytes   : string;
        E_AvailablePageStartBytes   : Boolean;


        F_SrcDstAreaZeroClearDisabled   : string;
        E_SrcDstAreaZeroClearDisabled   : Boolean;

        F_IsSrcDstBothPanel             : string;
        E_IsSrcDstBothPanel             : Boolean;

        F_IsManualInputModeSupported    : string;
        E_IsManualInputModeSupported    : Boolean;

        F_IsOpeMdEnabled                : string;
        E_IsOpeMdEnabled                : Boolean;

        F_IsOpeBpsEnabled               : string;
        E_IsOpeBpsEnabled               : Boolean;

    public

        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;
    end;


//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbPanelTypeList = class( TObjectList )
    private

	  	function    GetData( index : integer ) : TSbPanelType;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        procedure   ClearAll;

        function    Search( id : string ) : TSbPanelType;

 		property    Data[index:integer] : TSbPanelType	read GetData;
    end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbDeviceType   = class( TObject )

        F_Id                    : string;
        E_Id                    : Boolean;

        F_Name                  : string;
        E_Name                  : Boolean;

        F_PanelTypeId           : string;
        E_PanelTypeId           : Boolean;

        F_IsSubnetControllable  : string;
        E_IsSubnetControllable  : Boolean;

        F_IsSoapSupported       : string;
        E_IsSoapSupported       : Boolean;

        F_IsNsbusDevice         : string;
        E_IsNsbusDevice         : Boolean;


        F_IsPanelTypeVisible    : string;
        E_IsPanelTypeVisible    : Boolean;


    public

        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbDevicetypeList = class( TObjectList )
    private

        function    GetData( index : integer ) : TSbDeviceType;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        procedure   ClearAll;

        function    GetPanelTypeId( dtype : string ) : string;
        function    SearchPanelTypeId( id : string ) : TSbDeviceType;

 		property    Data[index:integer] : TSbDeviceType	read GetData;
    end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbXptBus   = class( TObject )

        F_Id                : string;
        E_Id                : Boolean;

        F_Name              : string;
        E_Name              : Boolean;

        F_Text              : string;
        E_Text              : Boolean;

        F_RecvLevelNo       : string;
        E_RecvLevelNo       : Boolean;

        F_SendLevelBitMask  : string;
        E_SendLevelBitMask  : Boolean;

        F_SendLevelBitMaskOffLine       : string;
        E_SendLevelBitMaskOffLine       : Boolean;

        F_DstPortNoRange    : string;
        E_DstPortNoRange    : Boolean;

        F_SrcPortNoRange    : string;
        E_SrcPortNoRange    : Boolean;

        F_NoAssignDstNo     : string;
        E_NoAssignDstNo     : Boolean;

        F_NoAssignSrcNo     : string;
        E_NoAssignSrcNo     : Boolean;

        F_IsVirtual         : string;
        E_IsVirtual         : Boolean;

        F_ColorName         : string;
        E_ColorName         : Boolean;

    public

        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbXptBusList = class( TObjectList )
    private

        function    GetData( index : integer ) : TSbXptBus;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        procedure   ClearAll;

 		property    Data[index:integer] : TSbXptBus	read GetData;
    end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbSrcNameBus   = class( TObject )

        F_Id                    : string;
        E_Id                    : Boolean;

        F_Name                  : string;
        E_Name                  : Boolean;

        F_AliasNo               : string;
        E_AliasNo               : Boolean;

        F_SrcPortNoRange        : string;
        E_SrcPortNoRange        : Boolean;

        F_IsProgramSendTarget   : string;
        E_IsProgramSendTarget   : Boolean;

        F_Note                  : string;
        E_Note                  : Boolean;

    public

        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbSrcNameBusList = class( TObjectList )
    private

        function    GetData( index : integer ) : TSbSrcNameBus;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        procedure   ClearAll;

        function    SearchName( nm : string ) : TSbSrcNameBus;

 		property    Data[index:integer] : TSbSrcNameBus	read GetData;
    end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbSrcNameGroup   = class( TObject )

        F_Id                    : string;
        E_Id                    : Boolean;

        F_Name                  : string;
        E_Name                  : Boolean;

        F_SrcPortNoRange        : string;
        E_SrcPortNoRange        : Boolean;

        F_Note                  : string;
        E_Note                  : Boolean;

    public

        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbSrcNameGroupList = class( TObjectList )
    private

        function    GetData( index : integer ) : TSbSrcNameGroup;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        procedure   ClearAll;

 		property    Data[index:integer] : TSbSrcNameGroup	read GetData;
    end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbDstNameBus   = class( TObject )

        F_Id                    : string;
        E_Id                    : Boolean;

        F_Name                  : string;
        E_Name                  : Boolean;

        F_AliasNo               : string;
        E_AliasNo               : Boolean;

        F_DstPortNoRange        : string;
        E_DstPortNoRange        : Boolean;

        F_IsProgramSendTarget   : string;
        E_IsProgramSendTarget   : Boolean;

        F_Note                  : string;
        E_Note                  : Boolean;

    public

        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbDstNameBusList = class( TObjectList )
    private

        function    GetData( index : integer ) : TSbDstNameBus;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        procedure   ClearAll;

        function    SearchName( nm : string ) : TSbDstNameBus;

 		property    Data[index:integer] : TSbDstNameBus	read GetData;
    end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbDstNameGroup   = class( TObject )

        F_Id                    : string;
        E_Id                    : Boolean;

        F_Name                  : string;
        E_Name                  : Boolean;

        F_DstPortNoRange        : string;
        E_DstPortNoRange        : Boolean;

        F_Note                  : string;
        E_Note                  : Boolean;

    public

        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbDstNameGroupList = class( TObjectList )
    private

        function    GetData( index : integer ) : TSbDstNameGroup;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        procedure   ClearAll;

 		property    Data[index:integer] : TSbDstNameGroup	read GetData;
    end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbDstInhibit   = class( TObject )

        F_DstPortNo             : string;
        E_DstPortNo             : Boolean;

        F_IsInhibit             : string;
        E_IsInhibit             : Boolean;

        F_IsReadOnly            : string;
        E_IsReadOnly            : Boolean;

        F_XptCategor            : string;
        E_XptCategor            : Boolean;

    public

        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbDstInhibitList = class( TObjectList )
    private

        function    GetData( index : integer ) : TSbDstInhibit;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        procedure   ClearAll;

 		property    Data[index:integer] : TSbDstInhibit	read GetData;
    end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbAlarmDefine   = class( TObject )

        F_AlarmCode         : string;
        E_AlarmCode         : Boolean;

        F_Level             : string;
        E_Level             : Boolean;

        F_Message           : string;
        E_Message           : Boolean;

        F_IsRecoverable     : string;
        E_IsRecoverable     : Boolean;

    public

        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbAlarmDefineList = class( TObjectList )
    private

        function    GetData( index : integer ) : TSbAlarmDefine;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        procedure   ClearAll;

 		property    Data[index:integer] : TSbAlarmDefine	read GetData;
    end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbPanelPageName   = class( TObject )

        F_Id                : string;
        E_Id                : Boolean;

        F_PanelTypeId       : string;
        E_PanelTypeId       : Boolean;

        F_PageNo            : string;
        E_PageNo            : Boolean;

        F_PageName          : string;
        E_PageName          : Boolean;

    public

        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbPanelPageNameList = class( TObjectList )
    private

        function    GetData( index : integer ) : TSbPanelPageName;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        procedure   ClearAll;

 		property    Data[index:integer] : TSbPanelPageName	read GetData;
    end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbDevicePanelPageName   = class( TObject )

        F_DeviceId          : string;
        E_DeviceId          : Boolean;

        F_PageNo            : string;
        E_PageNo            : Boolean;

        F_PageName          : string;
        E_PageName          : Boolean;

        F_DisplayOrder      : string;
        E_DisplayOrder      : Boolean;

        F_IsVisible         : string;
        E_IsVisible         : Boolean;

    public

        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbDevicePanelPageNameList = class( TObjectList )
    private

        function    GetData( index : integer ) : TSbDevicePanelPageName;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        procedure   ClearAll;

 		property    Data[index:integer] : TSbDevicePanelPageName	read GetData;
    end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbSrcColor   = class( TObject )

        F_Id                        : string;
        E_Id                        : Boolean;

        F_ScreenRgba                : string;
        E_ScreenRgba                : Boolean;

        F_ScreenTextRgba            : string;
        E_ScreenTextRgba            : Boolean;

        F_ScreenSelectedRgba        : string;
        E_ScreenSelectedRgba        : Boolean;

        F_ScreenTextSelectedRgba    : string;
        E_ScreenTextSelectedRgba    : Boolean;

        F_AliasText                 : string;
        E_AliasText                 : Boolean;
        AliasSpace                  : Boolean;

        F_DisplayName               : string;
        E_DisplayName               : Boolean;

    public

        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbSrcColorList = class( TObjectList )
    private

        function    GetData( index : integer ) : TSbSrcColor;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        procedure   ClearAll;

 		property    Data[index:integer] : TSbSrcColor	read GetData;
    end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbDstControlTarget   = class( TObject )

        F_DstPortNo     : string;
        E_DstPortNo     : Boolean;

        F_IsSbusTarget  : string;
        E_IsSbusTarget  : Boolean;

        F_IsNsBusTarget : string;
        E_IsNsBusTarget : Boolean;

    public

        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbDstControlTargetList = class( TObjectList )
    private

        function    GetData( index : integer ) : TSbDstControlTarget;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        procedure   ClearAll;

 		property    Data[index:integer] : TSbDstControlTarget	read GetData;
    end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbEditSrcSetGroup   = class( TObject )

        F_SrcNo             : string;
        E_SrcNo             : Boolean;

        F_LevelDefineId     : string;
        E_LevelDefineId     : Boolean;

        F_GroupName         : string;
        E_GroupName         : Boolean;

        F_ChCount           : string;
        E_ChCount           : Boolean;

    public

        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbEditSrcSetGroupList = class( TObjectList )
    private

        function    GetData( index : integer ) : TSbEditSrcSetGroup;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        procedure   ClearAll;

 		property    Data[index:integer] : TSbEditSrcSetGroup	read GetData;
    end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbEditDstSetGroup   = class( TObject )

        F_DstNo             : string;
        E_DstNo             : Boolean;

        F_LevelDefineId     : string;
        E_LevelDefineId     : Boolean;

        F_GroupName         : string;
        E_GroupName         : Boolean;

        F_ChCount           : string;
        E_ChCount           : Boolean;

    public

        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbEditDstSetGroupList = class( TObjectList )
    private

        function    GetData( index : integer ) : TSbEditDstSetGroup;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        procedure   ClearAll;

 		property    Data[index:integer] : TSbEditDstSetGroup	read GetData;
    end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbEditSrcLevelDefine   = class( TObject )

        F_Id                        : string;
        E_Id                        : Boolean;

        F_EditPortRanges            : string;
        E_EditPortRanges            : Boolean;

        F_VideoTargetPortRanges     : string;
        E_VideoTargetPortRanges     : Boolean;

        F_VideoLevelRange           : string;
        E_VideoLevelRange           : Boolean;

        F_AudioTargetPortRanges     : string;
        E_AudioTargetPortRanges     : Boolean;

        F_Audio1LevelRange          : string;
        E_Audio1LevelRange          : Boolean;

        F_Audio2LevelRange          : string;
        E_Audio2LevelRange          : Boolean;

        F_Audio3LevelRange          : string;
        E_Audio3LevelRange          : Boolean;

        F_Audio4LevelRange          : string;
        E_Audio4LevelRange          : Boolean;

        F_Audio5LevelRange          : string;
        E_Audio5LevelRange          : Boolean;

        F_Audio6LevelRange          : string;
        E_Audio6LevelRange          : Boolean;

        F_Audio7LevelRange          : string;
        E_Audio7LevelRange          : Boolean;

        F_Audio8LevelRange          : string;
        E_Audio8LevelRange          : Boolean;

        F_Audio9LevelRange          : string;
        E_Audio9LevelRange          : Boolean;

        F_Audio10LevelRange         : string;
        E_Audio10LevelRange         : Boolean;

        F_Audio11LevelRange         : string;
        E_Audio11LevelRange         : Boolean;

        F_Audio12LevelRange         : string;
        E_Audio12LevelRange         : Boolean;

        F_Audio13LevelRange         : string;
        E_Audio13LevelRange         : Boolean;

        F_Audio14LevelRange         : string;
        E_Audio14LevelRange         : Boolean;

        F_Audio15LevelRange         : string;
        E_Audio15LevelRange         : Boolean;

        F_Audio16LevelRange         : string;
        E_Audio16LevelRange         : Boolean;

    public

        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbEditSrcLevelDefineList = class( TObjectList )
    private

        function    GetData( index : integer ) : TSbEditSrcLevelDefine;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        procedure   ClearAll;

 		property    Data[index:integer] : TSbEditSrcLevelDefine	read GetData;
    end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbEditDstLevelDefine   = class( TObject )

        F_Id                        : string;
        E_Id                        : Boolean;

        F_EditPortRanges            : string;
        E_EditPortRanges            : Boolean;

        F_VideoTargetPortRanges     : string;
        E_VideoTargetPortRanges     : Boolean;

        F_VideoLevelRange           : string;
        E_VideoLevelRange           : Boolean;

        F_AudioTargetPortRanges     : string;
        E_AudioTargetPortRanges     : Boolean;

        F_Audio1LevelRange          : string;
        E_Audio1LevelRange          : Boolean;

        F_Audio2LevelRange          : string;
        E_Audio2LevelRange          : Boolean;

        F_Audio3LevelRange          : string;
        E_Audio3LevelRange          : Boolean;

        F_Audio4LevelRange          : string;
        E_Audio4LevelRange          : Boolean;

        F_Audio5LevelRange          : string;
        E_Audio5LevelRange          : Boolean;

        F_Audio6LevelRange          : string;
        E_Audio6LevelRange          : Boolean;

        F_Audio7LevelRange          : string;
        E_Audio7LevelRange          : Boolean;

        F_Audio8LevelRange          : string;
        E_Audio8LevelRange          : Boolean;

        F_Audio9LevelRange          : string;
        E_Audio9LevelRange          : Boolean;

        F_Audio10LevelRange         : string;
        E_Audio10LevelRange         : Boolean;

        F_Audio11LevelRange         : string;
        E_Audio11LevelRange         : Boolean;

        F_Audio12LevelRange         : string;
        E_Audio12LevelRange         : Boolean;

        F_Audio13LevelRange         : string;
        E_Audio13LevelRange         : Boolean;

        F_Audio14LevelRange         : string;
        E_Audio14LevelRange         : Boolean;

        F_Audio15LevelRange         : string;
        E_Audio15LevelRange         : Boolean;

        F_Audio16LevelRange         : string;
        E_Audio16LevelRange         : Boolean;

    public

        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbEditDstLevelDefineList = class( TObjectList )
    private

        function    GetData( index : integer ) : TSbEditDstLevelDefine;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        procedure   ClearAll;

 		property    Data[index:integer] : TSbEditDstLevelDefine	read GetData;
    end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbSystemMode   = class( TObject )

        F_Id                : string;
        E_Id                : Boolean;

        F_Name              : string;
        E_Name              : Boolean;

        F_Order             : string;
        E_Order             : Boolean;

        F_DisplayName       : string;
        E_DisplayName       : Boolean;

        F_SrcPortNoRange    : string;
        E_SrcPortNoRange    : Boolean;

        F_DefaultProgramId  : string;
        E_DefaultProgramId  : Boolean;

        F_DefaultProgramRowHeaderDisplayName    : string;
        E_DefaultProgramRowHeaderDisplayName    : Boolean;

        F_DefaultProgramTitleDisplayName        : string;
        E_DefaultProgramTitleDisplayName        : Boolean;

        F_Note              : string;
        E_Note              : Boolean;

    public

        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbSystemModeList = class( TObjectList )
    private

        function    GetData( index : integer ) : TSbSystemMode;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        procedure   ClearAll;

 		property    Data[index:integer] : TSbSystemMode	read GetData;
    end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbMultiLevelDst   = class( TObject )

        F_DstNo         : string;
        E_DstNo         : Boolean;

        F_DivDstLevel   : string;
        E_DivDstLevel   : Boolean;

        F_DivDstNoRange : string;
        E_DivDstNoRange : Boolean;

        F_Note          : string;
        E_Note          : Boolean;

    public

        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbMultiLevelDstList = class( TObjectList )
    private

        function    GetData( index : integer ) : TSbMultiLevelDst;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        procedure   ClearAll;

 		property    Data[index:integer] : TSbMultiLevelDst	read GetData;
    end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbMultiLevelSrc   = class( TObject )

        F_SrcNo         : string;
        E_SrcNo         : Boolean;

        F_DivSrcNoRange : string;
        E_DivSrcNoRange : Boolean;

        F_Note          : string;
        E_Note          : Boolean;

    public

        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbMultiLevelSrcList = class( TObjectList )
    private

        function    GetData( index : integer ) : TSbMultiLevelSrc;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        procedure   ClearAll;

 		property    Data[index:integer] : TSbMultiLevelSrc	read GetData;
    end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbPanelFunctionKeyDefine   = class( TObject )

        F_Id                    : string;
        E_Id                    : Boolean;
        F_Text                  : string;
        E_Text                  : Boolean;

    public

        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbPanelFunctionKeyDefineList = class( TObjectList )
    private

        function    GetData( index : integer ) : TSbPanelFunctionKeyDefine;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        procedure   ClearAll;

 		property    Data[index:integer] : TSbPanelFunctionKeyDefine	read GetData;
    end;


//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbPanelFunctionKeyMapping   = class( TObject )

        F_Id                    : string;
        E_Id                    : Boolean;
        F_PanelTypeId           : string;
        E_PanelTypeId           : Boolean;
        F_FunctionId            : string;
        E_FunctionId            : Boolean;
        F_FunctionNo            : string;
        E_FunctionNo            : Boolean;

    public

        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbPanelFunctionKeyMappingList = class( TObjectList )
    private

        function    GetData( index : integer ) : TSbPanelFunctionKeyMapping;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        procedure   ClearAll;

 		property    Data[index:integer] : TSbPanelFunctionKeyMapping    read GetData;
    end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbSettings   = class( TObject )

        F_ValueId           : string;
        E_ValueId           : Boolean;
        F_Value             : string;
        E_Value             : Boolean;

    public

        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSbSettingsList = class( TObjectList )
    private

        function    GetData( index : integer ) : TSbSettings;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        procedure   ClearAll;

 		property    Data[index:integer] : TSbSettings    read GetData;
    end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TSBusDb = class( TObject )
    private

        FSbDeviceList                   : TSbDeviceList;
        FSbPanelTypeList                : TSbPanelTypeList;
        FSbDeviceTypeList               : TSbDeviceTypeList;
        FSbXptBusList                   : TSbXptBusList;
        FSbSrcNameBusList               : TSbSrcNameBusList;
        FSbDstNameBusList               : TSbDstNameBusList;
        FSbSrcNameGroupList             : TSbSrcNameGroupList;
        FSbDstNameGroupList             : TSbDstNameGroupList;
        FSbDstInhibitList               : TSbDstInhibitList;
        FSbAlarmDefineList              : TSbAlarmDefineList;
        FSbPanelPageNameList            : TSbPanelPageNameList;
        FSbSettingsList                 : TSbSettingsList;
        FSbPanelFunctionKeyDefineList   : TSbPanelFunctionKeyDefineList;
        FSbPanelFunctionKeyMappingList  : TSbPanelFunctionKeyMappingList;
        FSbDevicePanelPageNameList      : TSbDevicePanelPageNameList;
        FSbSrcColorList                 : TSbSrcColorList;
        FSbDstControlTargetList         : TSbDstControlTargetList;
        FSbEditSrcSetGroupList          : TSbEditSrcSetGroupList;
        FSbEditDstSetGroupList          : TSbEditDstSetGroupList;
        FSbEditSrcLevelDefineList       : TSbEditSrcLevelDefineList;
        FSbEditDstLevelDefineList       : TSbEditDstLevelDefineList;
        FSbSystemModeList               : TSbSystemModeList;
        FSbMultiLevelDstList            : TSbMultiLevelDstList;
        FSbMultiLevelSrcList            : TSbMultiLevelSrcList;

        function    SbDeviceLoad( cnl : IXMLNodeList ) : TSbDevice;
        procedure   SbDeviceSave( XML_Doc : IXMLDocument );
        function    SbPanelTypeLoad( cnl : IXMLNodeList ) : TSbPanelType;
        procedure   SbPanelTypeSave( XML_Doc : IXMLDocument );
        function    SbDeviceTypeLoad( cnl : IXMLNodeList ) : TSbDeviceType;
        procedure   SbDeviceTypeSave( XML_Doc : IXMLDocument );
        procedure   SbXptBusLoad( cnl : IXMLNodeList );
        procedure   SbXptBusSave( XML_Doc : IXMLDocument );
        procedure   SbSrcNameBusLoad( cnl : IXMLNodeList );
        procedure   SbSrcNameBusSave( XML_Doc : IXMLDocument );
        procedure   SbSrcNameGroupLoad( cnl : IXMLNodeList );
        procedure   SbSrcNameGroupSave( XML_Doc : IXMLDocument );
        procedure   SbDstNameGroupLoad( cnl : IXMLNodeList );
        procedure   SbDstNameGroupSave( XML_Doc : IXMLDocument );
        procedure   SbDstNameBusLoad( cnl : IXMLNodeList );
        procedure   SbDstNameBusSave( XML_Doc : IXMLDocument );
        procedure   SbPanelFunctionKeyDefineLoad( cnl : IXMLNodeList );
        procedure   SbPanelFunctionKeyDefineSave( XML_Doc : IXMLDocument );
        procedure   SbPanelFunctionKeyMappingLoad( cnl : IXMLNodeList );
        procedure   SbPanelFunctionKeyMappingSave( XML_Doc : IXMLDocument );
        procedure   SbSettingsLoad( cnl : IXMLNodeList );
        procedure   SbSettingsSave( XML_Doc : IXMLDocument );
        procedure   SbDstInhibitLoad( cnl : IXMLNodeList );
        procedure   SbDstInhibitSave( XML_Doc : IXMLDocument );
        procedure   SbAlarmDefineLoad( cnl : IXMLNodeList );
        procedure   SbAlarmDefineSave( XML_Doc : IXMLDocument );
        procedure   SbPanelPageNameLoad( cnl : IXMLNodeList );
        procedure   SbPanelPageNameSave( XML_Doc : IXMLDocument );
        procedure   SbDevicePanelPageNameLoad( cnl : IXMLNodeList );
        procedure   SbDevicePanelPageNameSave( XML_Doc : IXMLDocument );
        procedure   SbSrcColorLoad( cnl : IXMLNodeList );
        procedure   SbSrcColorSave( XML_Doc : IXMLDocument );
        procedure   SbDstControlTargetLoad( cnl : IXMLNodeList );
        procedure   SbDstControlTargetsave( XML_Doc : IXMLDocument );
        procedure   SbEditSrcSetGroupLoad( cnl : IXMLNodeList );
        procedure   SbEditSrcSetGroupSave( XML_Doc : IXMLDocument );
        procedure   SbEditDstSetGroupLoad( cnl : IXMLNodeList );
        procedure   SbEditDstSetGroupSave( XML_Doc : IXMLDocument );
        procedure   SbEditSrcLevelDefineLoad( cnl : IXMLNodeList );
        procedure   SbEditSrcLevelDefineSave( XML_Doc : IXMLDocument );
        procedure   SbEditDstLevelDefineLoad( cnl : IXMLNodeList );
        procedure   SbEditDstLevelDefineSave( XML_Doc : IXMLDocument );
        procedure   SbSystemModeLoad( cnl : IXMLNodeList );
        procedure   SbSystemModeSave( XML_Doc : IXMLDocument );
        procedure   SbMultiLevelDstLoad( cnl : IXMLNodeList );
        procedure   SbMultiLevelDstSave( XML_Doc : IXMLDocument );
        procedure   SbMultiLevelSrcLoad( cnl : IXMLNodeList );
        procedure   SbMultiLevelSrcSave( XML_Doc : IXMLDocument );

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        function    Load( fn : string ) : Boolean;
        procedure   Save( fn : string );

        property    SbDeviceList : TSbDeviceList                read FSbDeviceList;
        property    SbPanelTypeList : TSbPanelTypeList          read FSbPanelTypeList;
        property    SbDeviceTypeList : TSbDeviceTypeList        read FSbDeviceTypeList;
        property    SbXptBusList : TSbXptBusList                read FSbXptBusList;
        property    SbSettingsList : TSbSettingsList            read FSbSettingsList;
        property    SbSrcNameBusList : TSbSrcNameBusList        read FSbSrcNameBusList;
        property    SbDstNameBusList : TSbDstNameBusList        read FSbDstNameBusList;
        property    SbSrcNameGroupList : TSbSrcNameGroupList    read FSbSrcNameGroupList;
        property    SbDstNameGroupList : TSbDstNameGroupList    read FSbDstNameGroupList;
        property    SbDstInhibitList : TSbDstInhibitList        read FSbDstInhibitList;
        property    SbAlarmDefineList : TSbAlarmDefineList      read FSbAlarmDefineList;
        property    SbPanelPageNameList : TSbPanelPageNameList  read FSbPanelPageNameList;
        property    SbDevicePanelPageNameList : TSbDevicePanelPageNameList  read FSbDevicePanelPageNameList;
        property    SbSrcColorList : TSbSrcColorList            read FSbSrcColorList;
        property    SbDstControlTargetList : TSbDstControlTargetList        read FSbDstControlTargetList;
        property    SbEditSrcSetGroupList : TSbEditSrcSetGroupList          read FSbEditSrcSetGroupList;
        property    SbEditDstSetGroupList : TSbEditDstSetGroupList          read FSbEditDstSetGroupList;
        property    SbEditSrcLevelDefineList : TSbEditSrcLevelDefineList    read FSbEditSrcLevelDefineList;
        property    SbEditDstLevelDefineList : TSbEditDstLevelDefineList    read FSbEditDstLevelDefineList;
        property    SbSystemModeList : TSbSystemModeList        read FSbSystemModeList;
        property    SbMultiLevelDstList : TSbMultiLevelDstList  read FSbMultiLevelDstList;
        property    SbMultiLevelSrcList : TSbMultiLevelSrcList  read FSbMultiLevelSrcList;

    end;


//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TXptRange = class( TObject )

        FMax    : integer;
        FMin    : integer;

        // コンストラクタ
        constructor Create( min, max : integer );

        // デストラクタ
        destructor 	Destroy; override;

    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TXptRangeList = class( TObjectList )
    private

        function GetData( index : integer ) :  TXptRange;

    public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        procedure   ClearAll;

        function    InRange( port : integer ) : Boolean;

    property

        Data[index:integer] : TXptRange     read GetData;

    end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TAcTerminal    = class( TObject )

        F_Id                                : string;
        F_Name                              : string;
        F_IpAddress                         : string;
        F_IsSaveButtonEnabled               : string;
        F_IsDefaultProgramLockButtonEnabled : string;
        F_IsRecBusNameEditable              : string;
        F_PermissionId                      : string;
        F_UnDeletable                       : string;
        F_IsServer                          : string;
        F_IsImExEnabled                     : string;
        F_IsLocked                          : string;
        F_IsOffLineTerminal                 : string;

        F_IsAllGroupEnabled                 : string;
        F_OnLineButtonEnabled               : string;
        F_IsPanelPageNameEditEnabled        : string;

    public

        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;
    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TAcTerminalList = class( TObjectList )
    private

	  	function    GetData( index : integer ) : TAcTerminal;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        procedure   ClearAll;

 		property    Data[index:integer] : TAcTerminal	read GetData;
    end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TAcPermission    = class( TObject )

        F_Id                                : string;
        F_Name                              : string;
        F_Description                       : string;
        F_IsRejectFilter                    : string;

    public

        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;
    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TAcPermissionList = class( TObjectList )
    private

	  	function    GetData( index : integer ) : TAcPermission;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        procedure   ClearAll;

 		property    Data[index:integer] : TAcPermission	read GetData;
    end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TAcFilter    = class( TObject )

        F_Id                                : string;
        F_PermissionId                      : string;
        F_TargetTypeName                    : string;
        F_TargetInstanceId                  : string;
        F_Enabled                           : string;

    public

        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;
    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TAcFilterList = class( TObjectList )
    private

	  	function    GetData( index : integer ) : TAcFilter;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        procedure   ClearAll;

 		property    Data[index:integer] : TAcFilter	read GetData;
    end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TAccountDb = class( TObject )
    private

        FAcTerminalList     : TAcTerminalList;
        FAcPermissionList   : TAcPermissionList;
        FAcFilterList       : TAcFilterList;

        procedure   AcTerminalload( cnl : IXMLNodeList );
        procedure   AcPermissionLoad( cnl : IXMLNodeList );
        procedure   AcFilterLoad( cnl : IXMLNodeList );

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        function    Load( fn : string ) : Boolean;

        property    AcTerminalList : TAcTerminalList        read FAcTerminalList;
        property    AcPermissionList : TAcPermissionList    read FAcPermissionList;
        property    AcFilterList : TAcFilterList            read FAcFilterList;

    end;


//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

(*
    TLayoutList = class( TObjectList )
    private

        function GetData( index : integer ) : TObject;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;


        property    Data[index:integer] : TObject       read GetData;

    end;
*)

    TLayoutData = class;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TLayoutButton = class( TObject )

        FButton     : TUiButton;

        FChild      : array [0..1] of TLayoutData;

        function    GetChild( index : integer ) : TLayoutData;
        procedure   SetChild( index : integer; ly : TLayoutData );

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        function    Clone : TLayoutButton;

        property    Button : TUiButton                  read FButton    write FButton;
        property    Child[index:integer] : TLayoutData  read GetChild   write SetChild;

    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TLayoutButtonList = class( TObjectList )
    private

        function GetData( index : integer ) : TLayoutButton;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        function    ClearAll : integer;

        function    Clone : TLayoutButtonList;

        function    SearchId( id : integer ) : TLayoutButton;

        procedure   SortButtonOrder;

        property    Data[index:integer] : TLayoutButton       read GetData;
    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TLayoutData = class( TObject )
    private

        FFrame          : TUiFrame;                     // 親フレーム

        FList           : TLayoutButtonList;

        function    GetGroupLayout( c, g, ds : integer ) : TLayoutData;
        function    GetGroup( c, ds : integer ) : TLayoutData;
        function    Getcategory( c : integer ) : TLayoutButton;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        function    Clone : TLayoutData;

        function    IsEmpty : Boolean;

        property    Frame : TUiFrame            read FFrame     write FFrame;
        property    List : TLayoutButtonList    read FList      write FList;

        property    GroupLayout[c,g,d:integer] : TLayoutData    read GetGroupLayout;
        property    Group[c,d:integer] : TLayoutData            read GetGroup;
        property    Category[c:integer] : TLayoutButton         read Getcategory;

    end;


//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TColumnData = class( TObject )
    private

        FColumn     : TUiListColumn;

//        FButton     : TUiListCellButton;
        FButtons    : TScreenList;

        FAlias      : integer;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        property    Column : TUiListColumn      read FColumn    write FColumn;
//        property    Button : TUiListCellButton  read FButton    write FButton;
        property    Buttons : TScreenList       read FButtons   write FButtons;
        property    Alias : integer             read FAlias     write FAlias;

    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TColumnList = class( TObjectList )
    private

        FList           : TUiList;      // 親リスト

        function    GetData( index : integer ) : TColumnData;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        procedure   ClearAll;

        procedure   Empty;

        procedure   SortOrder;

        property    List : TUiList      read FList      write FList;

        property    Data[index:integer] : TColumnData   read GetData;

    end;


//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TListLayout = class( TObject )
    private

        FColumnList     : array [0..1] of TColumnList;
        FAttribute      : string;

        function    GetColumnList( ds : integer ) : TColumnList;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        property    ColumnList[ds:integer] : TColumnList    read GetColumnList;
        property    Attribute : string      read FAttribute write FAttribute;

    end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TListLayoutList = class( TObjectList )
    private

        function    GetData( index : integer ) : TListLayout;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        procedure   ClearAll;

        property    Data[index:integer] : TListLayout   read GetData;

    end;


//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  UNDO/REDO用
//-----------------------------------------------------------------------------
    TLayoutBlock = class( TObject )
    private


  	public
        FLayoutData     : array [0..MAX_TYPE-1] of TLayoutData;

        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

//        function    Clone : TLayoutBlock;
        class function    Copy( dt : array of TLayoutData ) : TLayoutBlock;

        procedure   Restore( var dt : array of TLayoutData );
    end;

    TUndoData   = TLayoutBlock;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
    TLayoutBlockList = class( TObjectList )
    private

        FWP         : integer;
        FRP         : integer;

        function    GetData( index : integer ) : TLayoutBlock;

  	public
        // コンストラクタ
        constructor Create; virtual;

        // デストラクタ
        destructor 	Destroy; override;

        procedure   ClearAll;

        function    Last : TLayoutBlock;
        procedure   IncWriter;
        function    Undo : TLayoutBlock;
        function    Redo : TLayoutBlock;


        property    Data[index:integer] : TLayoutBlock       read GetData;

        property    Writer : integer        read FWP         write FWP;
        property    Reader : integer        read FRP         write FRP;


    end;


//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

implementation

uses
    XPTLayoutUnit;

procedure _beep;
begin
    Beep;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TScreenList.AllExtract( opt : integer );
var
    s : TScreenDb;

begin

    while True do begin
        s := Data[0];
        if s = nil then break;

            case opt of
            1:
                begin
//                    s.FPanel.Color := clSilver;
                end;
            end;

//        s.FPanel.Visible    := False;
//        s.FPanel.Parent     := nil;

        Extract( s );
    end;

end;

{
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TScreenList.AllExtract2;
var
    s : TScreenDb;
    i : integer;

begin
    for i:=0 to Count-1 do begin

        s := Data[i];
        if s = nil then break;

        s.FPanel.Visible    := False;
        s.FPanel.Parent     := nil;

    end;
end;
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TScreenList.AllExtract3;
var
    s : TScreenDb;

begin
    while True do begin
        s := Data[0];
        if s = nil then break;

//2020.12.26        s.FPanel.Visible    := False;
//2020.12.26        s.FPanel.Parent     := nil;

        Extract( s );
    end;
end;

//-----------------------------------------------------------------------------
//  空にする
//-----------------------------------------------------------------------------
procedure TScreenList.Empty;
var
    s : TScreenDb;

begin
    while True do begin
        s := Data[0];
        if s = nil then break;

        Extract( s );
    end;
end;

//-----------------------------------------------------------------------------
//	話数の降順
//-----------------------------------------------------------------------------
function SortDataType_Down( item1, item2 : Pointer ) : integer;
var
	n1, n2 : integer;

begin
    n1 	:= TUiButton( item1 ).FDataType;
    n2 	:= TUiButton( item2 ).FDataType;
	if n1 > n2 then 		Result := 1
	else if n1 < n2 then	Result := -1
    else                    Result := 0;
end;

//------------------------------------------------------------------------------
//  番組データ並び替え
//------------------------------------------------------------------------------
procedure TScreenList.SortDataType;
begin
    Sort( @SortDataType_Down );
end;


//------------------------------------------------------------------------------
// リストから削除
//------------------------------------------------------------------------------
procedure TScreenList.DeleteButton( btn : TUiButton; opt : integer );
var
    s : TUiButton;
    i : integer;

begin
    for i:=0 to Count-1 do begin
        s := Data[i];
        if True = s.IsSame( btn ) then begin
            Extract( s );

            // 削除する
            if opt = 1 then
                s.Free;

            Exit;
        end;
    end;

end;

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TScreenDb.Create;
begin
    Inherited;

//2020.12.26
{
    FPanel  := TPanel.Create( nil );

    FPanel.Parent           := nil;
    FPanel.Visible          := False;
    FPanel.ParentBackGround := False;
    FPanel.Color            := clSilver;
    FPanel.Caption          := '';
//    FPanel.BevelOuter   := bvNone;
    FPanel.BevelOuter       := bvLowered;
    FPanel.Alignment        := taLeftJustify;
    FPanel.VerticalAlignment := taAlignTop;

    FPanel.Font.Name        := 'メイリオ';
    FPanel.Font.Size        := 8;
    FPanel.Font.Style       := [fsBold];
}
    F_Id    := 1;
    E_Id    := True;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
destructor TScreenDb.Destroy;
begin

//2020.12.26    FPanel.Free;

    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TScreenDb.Clone( src : TScreenDb ) : TScreenDb;
begin
    case FDataType of
    UiFrame_No:
        begin
            Result := TUiFrame( Self ).Clone( TUiFrame( src ) );
        end;

    UiScreenSelectButton_No:
        begin
            Result := TUiScreenSelectButton( Self ).Clone( TUiScreenSelectButton( src ) );
        end;

    UiDstButton_No:
        begin
            Result := TUiDstButton( Self ).Clone( TUiDstButton( src ) );
        end;

    UiSrcButton_No:
        begin
            Result := TUiSrcButton( Self ).Clone( TUiSrcButton( src ) );
        end;

    UiPanelDstButton_No:
        begin
            Result := TUiPanelDstButton( Self ).Clone( TUiPanelDstButton( src ) );
        end;

    UiPanelSrcButton_No:
        begin
            Result := TUiPanelSrcButton( Self ).Clone( TUiPanelSrcButton( src ) );
        end;

    UiPanelKeyButton_No:
        begin
            Result := TUiPanelKeyButton( Self ).Clone( TUiPanelKeyButton( src ) );
        end;

    else
        Result := nil;

{    UiList_No                   = 2;
    UiListColumn_No             = 3;
    UiContent_No                = 4;
    UiListCellButton_No         = 5;
    UiPanelKeyButton_No         = 8;
    UiPanelDstButton_No         = 9;
    UiPanelSrcButton_No         = 10;
    UiColorSrcKeyButton_No      = 11;
}
    end;


end;


//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TScreenDb.IsSame( b : TUiButton ) : Boolean;
begin
    Result := (F_Id = b.F_Id) and (FDataType = b.FDataType);
end;

//2020.12.26
{
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TScreenDb.SetPosition( pa : TWinControl; rct : TRect; cap : string );
begin
    if pa = nil then begin
        FPanel.Visible := False;
    end
    else begin
        FPanel.Left    := rct.Left;
        FPanel.Top     := rct.Top;
        FPanel.Width   := rct.Right;
        FPanel.Height  := rct.Bottom;
        FPanel.Visible := True;
    end;

    FPanel.Caption      := cap;

    FPanel.Parent := pa;
end;
}

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TUiFrame.Create;
begin

    inherited;

    FDataType           := 0;

    F_Id                := 0;
    E_Id                := True;

    F_TitleText         := '';
    E_TitleText         := False;

    F_TitleBarVisible   := '';
    E_TitleBarVisible   := False;

    F_Name              := '';
    E_Name              := False;

    F_BackColor         := '';
    E_BackColor         := False;

    F_IsModal           := '';
    E_IsModal           := False;

    F_Order             := '';
    E_Order             := False;

    F_Left              := '';
    E_Left              := False;

    F_Width             := '';
    E_Width             := False;

    F_Top               := '';
    E_Top               := False;

    F_Height            := '';
    E_Height            := False;

    F_BorderWidth       := '';
    E_BorderWidth       := False;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TUiFrame.Destroy;
begin

    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TUiFrame.Clone( src : TUiFrame ) : TUiFrame;
var
    ui : TUiFrame;

begin

    if nil = src then   ui := TUiFrame.Create
    else                ui := src;

    ui.FDataType            := FDataType;

    ui.F_Id                 := F_Id;
    ui.E_Id                 := E_Id;

    ui.F_Note              := F_Note;
    ui.E_Note              := E_Note;

    ui.F_ParentFrameId     := F_ParentFrameId;
    ui.E_ParentFrameId     := E_ParentFrameId;

    ui.F_TitleText         := F_TitleText;
    ui.E_TitleText         := E_TitleText;

    ui.F_TitleBarHeightPix := F_TitleBarHeightPix;
    ui.E_TitleBarHeightPix := E_TitleBarHeightPix;

    ui.F_TitleBarVisible   := F_TitleBarVisible;
    ui.E_TitleBarVisible   := E_TitleBarVisible;

    ui.F_BackColor         := F_BackColor;
    ui.E_BackColor         := E_BackColor;

    ui.F_Type              := F_Type;
    ui.E_Type              := E_Type;

    ui.F_Name              := F_Name;
    ui.E_Name              := E_Name;

    ui.F_Attribute         := F_Attribute;
    ui.E_Attribute         := E_Attribute;

    ui.F_ColCount          := F_ColCount;
    ui.E_ColCount          := E_ColCount;

    ui.F_RowCount          := F_RowCount;
    ui.E_RowCount          := E_RowCount;

    ui.F_IsModal           := F_IsModal;
    ui.E_IsModal           := E_IsModal;

    ui.F_Order             := F_Order;
    ui.E_Order             := E_Order;

    ui.F_InnerOrder        := F_InnerOrder;
    ui.E_InnerOrder        := E_InnerOrder;

    ui.F_Left              := F_Left;
    ui.E_Left              := E_Left;

    ui.F_Width             := F_Width;
    ui.E_Width             := E_Width;

    ui.F_Top               := F_Top;
    ui.E_Top               := E_Top;

    ui.F_Height            := F_Height;
    ui.E_Height            := E_Height;

    ui.F_BorderWidth       := F_BorderWidth;
    ui.E_BorderWidth       := E_BorderWidth;

    ui.F_BorderColor       := F_BorderColor;
    ui.E_BorderColor       := E_BorderColor;

    Result := ui;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TUiScreenSelectButton.Create;
begin

    inherited;

    FDataType           := 1;

    F_Id                := 1;
    E_Id                := True;

    F_FrameId           := '';
    E_FrameId           := False;

    F_FrameName         := '';
    E_FrameName         := False;

    F_Order             := '';
    E_Order             := False;

    F_Left              := '';
    E_Left              := False;

    F_Width             := '';
    E_Width             := False;

    F_Top               := '';
    E_Top               := False;

    F_Height            := '';
    E_Height            := False;

    F_IncludeHeadbar    := '';
    E_IncludeHeadbar    := False;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TUiScreenSelectButton.Destroy;
begin

    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TUiScreenSelectButton.Clone( src : TUiScreenSelectButton ) : TUiScreenSelectButton;
var
    ui : TUiScreenSelectButton;

begin

    if nil = src then   ui := TUiScreenSelectButton.Create
    else                ui := src;

    ui.FDataType                := FDataType;

    ui.F_Id                     := F_Id;
    ui.E_Id                     := E_Id;

    ui.F_FrameId                := F_FrameId;
    ui.E_FrameId                := E_FrameId;

    ui.F_Text                   := F_Text;
    ui.E_Text                   := E_Text;

    ui.F_Key                    := F_Key;
    ui.E_Key                    := E_Key;

    ui.F_FrameName              := F_FrameName;
    ui.E_FrameName              := E_FrameName;

    ui.F_BeforeRelayKey         := F_BeforeRelayKey;
    ui.E_BeforeRelayKey         := E_BeforeRelayKey;

    ui.F_Attributes             := F_Attributes;
    ui.E_Attributes             := E_Attributes;

    ui.F_Order                  := F_Order;
    ui.E_Order                  := E_Order;

    ui.F_Left                   := F_Left;
    ui.E_Left                   := E_Left;

    ui.F_Width                  := F_Width;
    ui.E_Width                  := E_Width;

    ui.F_Top                    := F_Top;
    ui.E_Top                    := E_Top;

    ui.F_Height                 := F_Height;
    ui.E_Height                 := E_Height;

    ui.F_BorderWidth            := F_BorderWidth;
    ui.E_BorderWidth            := E_BorderWidth;

    ui.F_IncludeHeadbar         := F_IncludeHeadbar;
    ui.E_IncludeHeadbar         := E_IncludeHeadbar;

    ui.F_HeadbarColor           := F_HeadbarColor;
    ui.E_HeadbarColor           := E_HeadbarColor;

    ui.F_HeadbarHeight          := F_HeadbarHeight;
    ui.E_HeadbarHeight          := E_HeadbarHeight;

    ui.F_HeadbarText            := F_HeadbarText;
    ui.E_HeadbarText            := E_HeadbarText;

    ui.F_HeadbarFontSize        := F_HeadbarFontSize;
    ui.E_HeadbarFontSize        := E_HeadbarFontSize;

    ui.F_IsPermissionHandled    := F_IsPermissionHandled;
    ui.E_IsPermissionHandled    := E_IsPermissionHandled;

    ui.F_IsSelectionCancel      := F_IsSelectionCancel;
    ui.E_IsSelectionCancel      := E_IsSelectionCancel;

    ui.F_FontSize               := F_FontSize;
    ui.E_FontSize               := E_FontSize;

    ui.F_IsDisabled             := F_IsDisabled;
    ui.E_IsDisabled             := E_IsDisabled;

    ui.F_IsListItem             := F_IsListItem;
    ui.E_IsListItem             := E_IsListItem;

    Result := ui;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TUiList.Create;
begin
    inherited;

    FDataType           := 2;

    F_FrameId           := '';
    E_FrameId           := False;

    F_ListType          := '';
    E_ListType          := False;

    F_DefaultSortColumnName     := '';
    E_DefaultSortColumnName     := False;

    F_AllowMultiSort    := '';
    E_AllowMultiSort    := False;

    F_FilterButtonWidth := '';
    E_FilterButtonWidth := False;

    F_RowHeight         := '';
    E_RowHeight         := False;

    F_RowHeaderColumnName     := '';
    E_RowHeaderColumnName     := False;

    F_ColumnFontSize    := '';
    E_ColumnFontSize    := False;

    F_CellFontSize      := '';
    E_CellFontSize      := False;

    F_Order             := '';
    E_Order             := False;

    F_Left              := '';
    E_Left              := False;

    F_Width             := '';
    E_Width             := False;

    F_Top               := '';
    E_Top               := False;

    F_Height            := '';
    E_Height            := False;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TUiList.Destroy;
begin

    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TUiList.Clone( src : TUiList ) : TUiList;
var
    ui : TUiList;

begin

    if nil = src then   ui := TUiList.Create
    else                ui := src;

    ui.FDataType                := FDataType;

    ui.F_Id                     := F_Id;
    ui.E_Id                     := E_Id;

    ui.F_FrameId                := F_FrameId;
    ui.E_FrameId                := E_FrameId;

    ui.F_ListType               := F_ListType;
    ui.E_ListType               := E_ListType;

    ui.F_Attributes             := F_Attributes;
    ui.E_Attributes             := E_Attributes;

    ui.F_DefaultSortColumnName  := F_DefaultSortColumnName;
    ui.E_DefaultSortColumnName  := E_DefaultSortColumnName;

    ui.F_AllowMultiSort         := F_AllowMultiSort;
    ui.E_AllowMultiSort         := E_AllowMultiSort;

    ui.F_FilterButtonWidth      := F_FilterButtonWidth;
    ui.E_FilterButtonWidth      := E_FilterButtonWidth;

    ui.F_RowHeight              := F_RowHeight;
    ui.E_RowHeight              := E_RowHeight;

    ui.F_RowHeaderColumnName    := F_RowHeaderColumnName;
    ui.E_RowHeaderColumnName    := E_RowHeaderColumnName;

    ui.F_RowHeaderClickAction   := F_RowHeaderClickAction;
    ui.E_RowHeaderClickAction   := E_RowHeaderClickAction;

    ui.F_ColumnFontSize         := F_ColumnFontSize;
    ui.E_ColumnFontSize         := E_ColumnFontSize;

    ui.F_CellFontSize           := F_CellFontSize;
    ui.E_CellFontSize           := E_CellFontSize;

    ui.F_Order                  := F_Order;
    ui.E_Order                  := E_Order;

    ui.F_Left                   := F_Left;
    ui.E_Left                   := E_Left;

    ui.F_Width                  := F_Width;
    ui.E_Width                  := E_Width;

    ui.F_Top                    := F_Top;
    ui.E_Top                    := E_Top;

    ui.F_Height                 := F_Height;
    ui.E_Height                 := E_Height;

    Result := ui;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TUiListColumn.Create;
begin

    inherited;

    FDataType           := 3;

    F_ListId    := '';
    E_ListId    := False;

    F_Order     := '';
    E_Order     := False;

    F_Width     := '';
    E_Width     := False;

    F_IsVisible := '';
    E_IsVisible := False;

    F_IsReadOnly        := '';
    E_IsReadOnly        := False;

    F_Text          := '';
    E_Text          := False;

    F_ColName       := '';
    E_ColName       := False;


    F_ColHeaderClickAction  := '';
    E_ColHeaderClickAction  := False;

    F_CellType      := '';
    E_CellType      := False;

    F_AllowSort     := '';
    E_AllowSort     := False;

    F_AllowFilter   := '';
    E_AllowFilter   := False;

    F_AllowWideChar := '';
    E_AllowWideChar := False;

    F_MaxLangth     := '';
    E_MaxLangth     := False;

    F_MaxLengthIsBytes  := '';
    E_MaxLengthIsBytes  := False;

    F_CellTextHAlign    := '';
    E_CellTextHAlign    := False;

    F_CanReEntry        := '';
    E_CanReEntry        := False;

    F_IsCellButtonCol   := '';
    E_IsCellButtonCol   := False;

    F_IsRowSelectSync   := '';
    E_IsRowSelectSync   := False;

    F_BoolTrueText      := '';
    E_BoolTrueText      := False;

    F_BoolFalseText     := '';
    E_BoolFalseText     := False;
end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TUiListColumn.Destroy;
begin

    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TUiListColumn.Clone( src : TUiListColumn ) : TUiListColumn;
var
    ui : TUiListColumn;

begin

    if nil = src then   ui := TUiListColumn.Create
    else                ui := src;

    ui.FDataType                := FDataType;

    ui.F_Id                     := F_Id;
    ui.E_Id                     := E_Id;

    ui.F_ListId                 := F_ListId;
    ui.E_ListId                 := E_ListId;

    ui.F_Order                  := F_Order;
    ui.E_Order                  := E_Order;

    ui.F_SortOrder              := F_SortOrder;
    ui.E_SortOrder              := E_SortOrder;

    ui.F_Width                  := F_Width;
    ui.E_Width                  := E_Width;

    ui.F_IsVisible              := F_IsVisible;
    ui.E_IsVisible              := E_IsVisible;

    ui.F_IsReadOnly             := F_IsReadOnly;
    ui.E_IsReadOnly             := E_IsReadOnly;

    ui.F_Text                   := F_Text;
    ui.E_Text                   := E_Text;

    ui.F_ColName                := F_ColName;
    ui.E_ColName                := E_ColName;

    ui.F_ColAlias               := F_ColAlias;
    ui.E_ColAlias               := E_ColAlias;

    ui.F_ColHeaderClickAction   := F_ColHeaderClickAction;
    ui.E_ColHeaderClickAction   := E_ColHeaderClickAction;

    ui.F_CellType               := F_CellType;
    ui.E_CellType               := E_CellType;

    ui.F_EnumTypeName           := F_EnumTypeName;
    ui.E_EnumTypeName           := E_EnumTypeName;

    ui.F_Format                 := F_Format;
    ui.E_Format                 := E_Format;

    ui.F_Attribute              := F_Attribute;
    ui.E_Attribute              := E_Attribute;

    ui.F_AllowSort              := F_AllowSort;
    ui.E_AllowSort              := E_AllowSort;

    ui.F_AllowFilter            := F_AllowFilter;
    ui.E_AllowFilter            := E_AllowFilter;

    ui.F_AllowWideChar          := F_AllowWideChar;
    ui.E_AllowWideChar          := E_AllowWideChar;

    ui.F_MaxLangth              := F_MaxLangth;
    ui.E_MaxLangth              := E_MaxLangth;

    ui.F_MaxLengthIsBytes       := F_MaxLengthIsBytes;
    ui.E_MaxLengthIsBytes       := E_MaxLengthIsBytes;

    ui.F_DisplayMaxLineCount    := F_DisplayMaxLineCount;
    ui.E_DisplayMaxLineCount    := E_DisplayMaxLineCount;

    ui.F_ColumnFontSize         := F_ColumnFontSize;
    ui.E_ColumnFontSize         := E_ColumnFontSize;

    ui.F_CellFontSize           := F_CellFontSize;
    ui.E_CellFontSize           := E_CellFontSize;

    ui.F_CellTextHAlign         := F_CellTextHAlign;
    ui.E_CellTextHAlign         := E_CellTextHAlign;

    ui.F_CanReEntry             := F_CanReEntry;
    ui.E_CanReEntry             := E_CanReEntry;

    ui.F_IsCellButtonCol        := F_IsCellButtonCol;
    ui.E_IsCellButtonCol        := E_IsCellButtonCol;

    ui.F_IsRowSelectSync        := F_IsRowSelectSync;
    ui.E_IsRowSelectSync        := E_IsRowSelectSync;

    ui.F_BoolTrueText           := F_BoolTrueText;
    ui.E_BoolTrueText           := E_BoolTrueText;

    ui.F_BoolFalseText          := F_BoolFalseText;
    ui.E_BoolFalseText          := E_BoolFalseText;

    ui.F_IsFontSizeAdjustable   := F_IsFontSizeAdjustable;
    ui.E_IsFontSizeAdjustable   := E_IsFontSizeAdjustable;

    ui.F_FooterText             := F_FooterText;
    ui.E_FooterText             := E_FooterText;

    Result := ui;
end;
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TUiContent.Create;
begin

    inherited;

    FDataType   := 4;

    F_FrameId   := '';
    E_FrameId   := False;

    F_Text      := '';
    E_Text      := False;

    F_UiType    := '';
    E_UiType    := False;

    F_Order     := '';
    E_Order     := False;

    F_Left      := '';
    E_Left      := False;

    F_Width     := '';
    E_Width     := False;

    F_Top       := '';
    E_Top       := False;

    F_Height    := '';
    E_Height    := False;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TUiContent.Destroy;
begin

    inherited;

end;


//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TUiListCellButton.Create;
begin

    inherited;

    FDataType       := 5;

    F_ColumnId      := '';
    E_ColumnId      := False;

    F_Order         := '';
    E_Order         := False;

    F_Width         := '';
    E_Width         := False;

    F_Text          := '';
    E_Text          := False;

    F_ClickAction   := '';
    E_ClickAction   := False;

    F_IsDefaultRowVisible   := '';
    E_IsDefaultRowVisible   := False;

    F_IsStandartRowVisible  := '';
    E_IsStandartRowVisible  := False;

    F_FontSize              := '';
    E_FontSize              := False;

    F_IsRowSelectSync       := '';
    E_IsRowSelectSync       := False;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TUiListCellButton.Destroy;
begin

    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TUiListCellButton.Clone( src : TUiListCellButton ) : TUiListCellButton;
var
    ui : TUiListCellButton;

begin

    if nil = src then   ui := TUiListCellButton.Create
    else                ui := src;

    ui.FDataType                := FDataType;

    ui.F_Id                     := F_Id;
    ui.E_Id                     := E_Id;

    ui.F_ColumnId               := F_ColumnId;
    ui.E_ColumnId               := E_ColumnId;

    ui.F_Order                  := F_Order;
    ui.E_Order                  := E_Order;

    ui.F_Width                  := F_Width;
    ui.E_Width                  := E_Width;

    ui.F_Text                   := F_Text;
    ui.E_Text                   := E_Text;

    ui.F_ClickAction            := F_ClickAction;
    ui.E_ClickAction            := E_ClickAction;

    ui.F_IsDefaultRowVisible    := F_IsDefaultRowVisible;
    ui.E_IsDefaultRowVisible    := E_IsDefaultRowVisible;

    ui.F_IsStandartRowVisible   := F_IsStandartRowVisible;
    ui.E_IsStandartRowVisible   := E_IsStandartRowVisible;

    ui.F_FontSize               := F_FontSize;
    ui.E_FontSize               := E_FontSize;

    ui.F_IsRowSelectSync        := F_IsRowSelectSync;
    ui.E_IsRowSelectSync        := E_IsRowSelectSync;

    ui.F_HeadbarHeight          := F_HeadbarHeight;
    ui.E_HeadbarHeight          := E_HeadbarHeight;

    Result := ui;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TUiDstButton.Create;
begin

    inherited;

    FDataType   := 6;

    F_Id        := 1;
    E_Id        := True;

    F_FrameId   := '';
    E_FrameId   := False;

    F_DstPortNo := '';
    E_DstPortNo := False;

    F_Order     := '';
    E_Order     := False;

    F_Left      := '';
    E_Left      := False;

    F_Width     := '';
    E_Width     := False;

    F_Top       := '';
    E_Top       := False;

    F_Height    := '';
    E_Height    := False;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TUiDstButton.Destroy;
begin

    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TUiDstButton.Clone( src : TUiDstButton ) : TUiDstButton;
var
    ui : TUiDstButton;

begin

    if nil = src then   ui := TUiDstButton.Create
    else                ui := src;

    ui.FDataType            := FDataType;

    ui.F_Id                 := F_Id;
    ui.E_Id                 := E_Id;

    ui.F_FrameId            := F_FrameId;
    ui.E_FrameId            := E_FrameId;

    ui.F_DstPortNo          := F_DstPortNo;
    ui.E_DstPortNo          := E_DstPortNo;

    ui.F_IsListItem         := F_IsListItem;
    ui.E_IsListItem         := E_IsListItem;

    ui.F_DstHeightPx        := F_DstHeightPx;
    ui.E_DstHeightPx        := E_DstHeightPx;

    ui.F_FontSize           := F_FontSize;
    ui.E_FontSize           := E_FontSize;

    ui.F_Order              := F_Order;
    ui.E_Order              := E_Order;

    ui.F_Left               := F_Left;
    ui.E_Left               := E_Left;

    ui.F_Width              := F_Width;
    ui.E_Width              := E_Width;

    ui.F_Top                := F_Top;
    ui.E_Top                := E_Top;

    ui.F_Height             := F_Height;
    ui.E_Height             := E_Height;

    ui.F_BorderWidth        := F_BorderWidth;
    ui.E_BorderWidth        := E_BorderWidth;

    ui.F_IsDisabled         := F_IsDisabled;
    ui.E_IsDisabled         := E_IsDisabled;

    ui.F_SystemModeBitMask  := F_SystemModeBitMask;
    ui.E_SystemModeBitMask  := E_SystemModeBitMask;

    ui.F_Attrubute          := F_Attrubute;
    ui.E_Attrubute          := E_Attrubute;

    ui.F_IsHeadBarHidden    := F_IsHeadBarHidden;
    ui.E_IsHeadBarHidden    := E_IsHeadBarHidden;

    ui.F_DstFontSize        := F_DstFontSize;
    ui.E_DstFontSize        := E_DstFontSize;

    Result := ui;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TUiSrcButton.Create;
begin

    inherited;

    FDataType   := 7;

    F_Id        := 1;
    E_Id        := True;

    F_FrameId   := '';
    E_FrameId   := False;

    F_SrcPortNo := '';
    E_SrcPortNo := False;

    F_Order     := '';
    E_Order     := False;

    F_Left      := '';
    E_Left      := False;

    F_Width     := '';
    E_Width     := False;

    F_Top       := '';
    E_Top       := False;

    F_Height    := '';
    E_Height    := False;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TUiSrcButton.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TUiSrcButton.Clone( src : TUiSrcButton ) : TUiSrcButton;
var
    ui : TUiSrcButton;

begin

    if nil = src then   ui := TUiSrcButton.Create
    else                ui := src;

    ui.FDataType        := FDataType;

    ui.F_Id             := F_Id;
    ui.E_Id             := E_Id;

    ui.F_FrameId        := F_FrameId;
    ui.E_FrameId        := E_FrameId;

    ui.F_SrcPortNo      := F_SrcPortNo;
    ui.E_SrcPortNo      := E_SrcPortNo;

    ui.F_Order          := F_Order;
    ui.E_Order          := E_Order;

    ui.F_Left           := F_Left;
    ui.E_Left           := E_Left;

    ui.F_Width          := F_Width;
    ui.E_Width          := E_Width;

    ui.F_Top            := F_Top;
    ui.E_Top            := E_Top;

    ui.F_Height         := F_Height;
    ui.E_Height         := E_Height;

    ui.F_SystemModeBitMask  := F_SystemModeBitMask;
    ui.E_SystemModeBitMask  := E_SystemModeBitMask;

    ui.F_FontSize       := F_FontSize;
    ui.E_FontSize       := E_FontSize;

    ui.F_Attribute      := F_Attribute;
    ui.E_Attribute      := E_Attribute;

    Result := ui;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TUiPanelKeyButton.Create;
begin

    inherited;

    FDataType   := 8;

    F_FrameId   := '';
    E_FrameId   := False;

    F_ButtonNo  := '';
    E_ButtonNo  := False;

    F_CopyButtonNo  := '';
    E_CopyButtonNo  := False;

    F_Order     := '';
    E_Order     := False;

    F_Left      := '';
    E_Left      := False;

    F_Width     := '';
    E_Width     := False;

    F_Top       := '';
    E_Top       := False;

    F_Height    := '';
    E_Height    := False;
end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TUiPanelKeyButton.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TUiPanelKeyButton.Clone( src : TUiPanelKeyButton ) : TUiPanelKeyButton;
var
    ui : TUiPanelKeyButton;

begin

    if nil = src then   ui := TUiPanelKeyButton.Create
    else                ui := src;

    ui.FDataType        := FDataType;

    ui.F_Id             := F_Id;
    ui.E_Id             := E_Id;

    ui.F_FrameId        := F_FrameId;
    ui.E_FrameId        := E_FrameId;

    ui.F_ButtonNo       := F_ButtonNo;
    ui.E_ButtonNo       := E_ButtonNo;

    ui.F_CopyButtonNo   := F_CopyButtonNo;
    ui.E_CopyButtonNo   := E_CopyButtonNo;

    ui.F_Order          := F_Order;
    ui.E_Order          := E_Order;

    ui.F_Left           := F_Left;
    ui.E_Left           := E_Left;

    ui.F_Width          := F_Width;
    ui.E_Width          := E_Width;

    ui.F_Top            := F_Top;
    ui.E_Top            := E_Top;

    ui.F_Height         := F_Height;
    ui.E_Height         := E_Height;

    Result := ui;
end;
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TUiPanelDstButton.Create;
begin

    inherited;

    FDataType   := 9;

    F_FrameId   := '';
    E_FrameId   := False;

    F_DstPortNo := '';
    E_DstPortNo := False;

    F_Order     := '';
    E_Order     := False;

    F_Left      := '';
    E_Left      := False;

    F_Width     := '';
    E_Width     := False;

    F_Top       := '';
    E_Top       := False;

    F_Height    := '';
    E_Height    := False;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TUiPanelDstButton.Destroy;
begin

    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TUiPanelDstButton.Clone( src : TUiPanelDstButton ) : TUiPanelDstButton;
var
    ui : TUiPanelDstButton;

begin

    if nil = src then   ui := TUiPanelDstButton.Create
    else                ui := src;

    ui.FDataType        := FDataType;

    ui.F_Id             := F_Id;
    ui.E_Id             := E_Id;

    ui.F_FrameId       := F_FrameId;
    ui.E_FrameId       := E_FrameId;

    ui.F_DstPortNo     := F_DstPortNo;
    ui.E_DstPortNo     := E_DstPortNo;

    ui.F_Order         := F_Order;
    ui.E_Order         := E_Order;

    ui.F_Left          := F_Left;
    ui.E_Left          := E_Left;

    ui.F_Width         := F_Width;
    ui.E_Width         := E_Width;

    ui.F_Top           := F_Top;
    ui.E_Top           := E_Top;

    ui.F_Height        := F_Height;
    ui.E_Height        := E_Height;

    ui.F_BorderWidth   := F_BorderWidth;
    ui.E_BorderWidth   := E_BorderWidth;

    ui.F_SystemModeBitMask := F_SystemModeBitMask;
    ui.E_SystemModeBitMask := E_SystemModeBitMask;

    Result := ui;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TUiPanelSrcButton.Create;
begin

    inherited;

    FDataType   := 10;

    F_FrameId   := '';
    E_FrameId   := False;

    F_SrcPortNo := '';
    E_SrcPortNo := False;

    F_Order     := '';
    E_Order     := False;

    F_Left      := '';
    E_Left      := False;

    F_Width     := '';
    E_Width     := False;

    F_Top       := '';
    E_Top       := False;

    F_Height    := '';
    E_Height    := False;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TUiPanelSrcButton.Destroy;
begin

    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TUiPanelSrcButton.Clone( src : TUiPanelSrcButton=nil ) : TUiPanelSrcButton;
var
    ui : TUiPanelSrcButton;

begin

    if nil = src then   ui := TUiPanelSrcButton.Create
    else                ui := src;

    ui.FDataType        := FDataType;

    ui.F_Id             := F_Id;
    ui.E_Id             := E_Id;

    ui.F_FrameId        := F_FrameId;
    ui.E_FrameId        := E_FrameId;

    ui.F_SrcPortNo      := F_SrcPortNo;
    ui.E_SrcPortNo      := E_SrcPortNo;

    ui.F_Order          := F_Order;
    ui.E_Order          := E_Order;

    ui.F_Left           := F_Left;
    ui.E_Left           := E_Left;

    ui.F_Width          := F_Width;
    ui.E_Width          := E_Width;

    ui.F_Top            := F_Top;
    ui.E_Top            := E_Top;

    ui.F_Height         := F_Height;
    ui.E_Height         := E_Height;

    ui.F_SystemModeBitMask := F_SystemModeBitMask;
    ui.E_SystemModeBitMask := E_SystemModeBitMask;

    Result := ui;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TUiColorSrcKeyButton.Create;
begin

    inherited;

    FDataType   := 11;

    F_FrameId   := '';
    E_FrameId   := False;

    F_SrcPortNo := '';
    E_SrcPortNo := False;

    F_Order     := '';
    E_Order     := False;

    F_Left      := '';
    E_Left      := False;

    F_Width     := '';
    E_Width     := False;

    F_Top       := '';
    E_Top       := False;

    F_Height    := '';
    E_Height    := False;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TUiColorSrcKeyButton.Destroy;
begin
    inherited;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TScreenList.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TScreenList.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TScreenList.GetData( index : integer ) : TScreenDb;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TScreenDb( Items[ index ] );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TScreenList.ClearAll;
var
    dt : TScreenDb;

begin
    while True do begin
        dt := Data[0];
        if nil = dt then break;

        Extract( dt );
        dt.Free;
    end;

end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function TScreenList.Search( bType, bId : integer ) : TScreenDb;
var
    s : TScreenDb;
    i : integer;

begin
    for i:=0 to Count-1 do begin
        s := Data[i];
        if (bId = s.F_Id) and (bType = s.FDataType) then begin
            Result := s;
            Exit;
        end;
    end;

    Result := nil;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function TScreenList.SearchByName( bType : integer; nm : string ) : TScreenDb;
var
    s : TScreenDb;
    i : integer;
    u : TUiFrame;

begin
    for i:=0 to Count-1 do begin
        s := Data[i];
        if bType = s.FDataType then begin

            case bType of
            UiFrame_No:
                begin
                    u := TUiFrame( s );
                    if (nm <> '') and (nm = u.F_Name) then begin
                        Result := s;
                        Exit;
                    end;
                end;
            else
                ;
            end;

        end;
    end;

    Result := nil;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function TScreenList.SearchByTitle( bType : integer; ttl : string ) : TScreenDb;
var
    s : TScreenDb;
    i : integer;
    u : TUiFrame;
    ul : TUiList;

begin
    for i:=0 to Count-1 do begin
        s := Data[i];
        if bType = s.FDataType then begin

            case bType of
            UiFrame_No:
                begin
                    u := TUiFrame( s );
                    if (ttl <> '') and (ttl = u.F_TitleText) then begin
                        Result := s;
                        Exit;
                    end;
                end;

            UiList_No:
                begin
                    ul := TUiList( s );
                    if (ttl <> '') and (ttl = ul.F_ListType) then begin
                        Result := s;
                        Exit;
                    end;
                end;


            else
                ;
            end;

        end;
    end;

    Result := nil;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function TScreenList.SearchByListType( ttl : string; lst : TScreenList ) : integer;
var
    s : TScreenDb;
    i : integer;
//    u : TUiFrame;
    ul : TUiList;

begin
    lst.Clear;

    for i:=0 to Count-1 do begin

        s := Data[i];
        if UiList_No <> s.FDataType then continue;

        ul := TUiList( s );
        if (ttl <> '') and (ttl = ul.F_ListType) then begin
            lst.Add( s );
        end;
    end;

    Result := lst.Count;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function TScreenList.SearchList( id : string ) : TUiList;
var
    s : TScreenDb;
    i : integer;

begin
    for i:=0 to Count-1 do begin
        s := Data[i];
        if (2 = s.FDataType) and (id = IntToStr( s.F_id )) then begin
            Result := TUiList( s );
            Exit;
        end;
    end;

    Result := nil;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function TScreenList.SearchType( bType : integer; lst : TScreenList ) : integer;
var
    s : TScreenDb;
    i : integer;

begin
    for i:=0 to Count-1 do begin
        s := Data[i];
        if (bType = s.FDataType) then begin
            lst.Add( s );
        end;
    end;

    Result := lst.Count;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function TScreenList.SearchButton( bType : integer; bId : string; lst : TScreenList ) : integer;
var
    s : TUiScreenSelectButton;
    i : integer;

begin
    for i:=0 to Count-1 do begin
        s := TUiScreenSelectButton( Data[i] );

        if (bType = s.FDataType) and (bId = s.F_FrameId) then begin
            lst.Add( s );
        end;
    end;

    Result := lst.Count;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function TScreenList.SearchButton( bType : integer; bId : string ) : TUiScreenSelectButton;
var
    s : TUiScreenSelectButton;
    i : integer;

begin
    for i:=0 to Count-1 do begin
        s := TUiScreenSelectButton( Data[i] );

        if (bType = s.FDataType) and (StrToIntDef(bId, 0) = s.F_Id) then begin
            Result := s;
            Exit;
        end;
    end;

    Result := nil;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function TScreenList.SearchSource( bType : integer; bId : string; lst : TScreenList ) : integer;
var
    ui : TUiButton;
    s : TUiSrcButton;
    d : TUidstButton;
    ps : TUiPanelSrcButton;
    pd : TUiPanelDstButton;
    b : TUiScreenSelectButton;
    f : TUiFrame;
    i : integer;
    lc : TUiListColumn;
    lcc : TUiListCellButton;
    pk : TUiPanelKeyButton;

begin
    for i:=0 to Count-1 do begin

        ui := Data[i];
        if bType <> ui.FDataType then continue;

        case bType of
        UiFrame_No:
            begin
                f := TUiFrame( Data[i] );

                if bId = f.F_ParentFrameId then begin
                    lst.Add( f );
                end;
            end;

        UiScreenSelectButton_No:
            begin
                b := TUiScreenSelectButton( Data[i] );

                if bId = b.F_FrameId then begin
                    lst.Add( b );
                end;

            end;

        UiSrcButton_No:
            begin
                s := TUiSrcButton( Data[i] );

                if bId = s.F_FrameId then begin
                    lst.Add( s );
                end;

            end;

        UiDstButton_No:
            begin
                d := TUidstButton( Data[i] );

                if bId = d.F_FrameId then begin
                    lst.Add( d );
                end;

            end;

        UiPanelSrcButton_No:
            begin
                ps := TUiPanelSrcButton( Data[i] );

                if bId = ps.F_FrameId then begin
                    lst.Add( ps );
                end;

            end;

        UiPanelDstButton_No:
            begin
                pd := TUiPanelDstButton( Data[i] );

                if bId = pd.F_FrameId then begin
                    lst.Add( pd );
                end;

            end;


        UiListColumn_No:
            begin
                lc := TUiListColumn( Data[i] );

                if bId = lc.F_ListId then begin
                    lst.Add( lc );
                end;

            end;

        UiListCellButton_No:
            begin
                lcc := TUiListCellButton( Data[i] );

                if bId = lcc.F_ColumnId then begin
                    lst.Add( lcc );
                end;

            end;

        UiPanelKeyButton_No:
            begin
                pk := TUiPanelKeyButton( Data[i] );

                if bId = pk.F_FrameId then begin
                    lst.Add( pk );
                end;

            end;

        end;


{
                s := TUiSrcButton( Data[i] );

                if (bType = s.FDataType) and (bId = s.F_FrameId) then begin
                    lst.Add( s );
                end;
}

    end;

    Result := lst.Count;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function TScreenList.NewId( dtype : integer ) : integer;
var
    i, max : integer;
    f : TUiFrame;
    so : TUiSrcButton;
    s : TUiScreenSelectButton;
    d : TUiDstButton;
    ui : TUiButton;
    pd : TUiPanelDstButton;
    pso : TUiPanelSrcButton;

begin

//    max := -1;
    max := 1;

    for i:=0 to Count-1 do begin

        ui := Data[i];
        if ui.FDataType <> dType then continue;

        case dtype of
        UiFrame_No:
            begin
                f := TUiFrame( ui );

                if f.F_id >= max then
                    max := f.F_id + 1;
            end;

        UiScreenSelectButton_No:
            begin
                s := TUiScreenSelectButton( ui );

                if s.F_id >= max then
                    max := s.F_id + 1;
            end;

        UiDstButton_No:
            begin
                d := TUiDstButton( ui );

                if d.F_id >= max then
                    max := d.F_id + 1;
            end;

        UiSrcButton_No:
            begin
                so := TUiSrcButton( ui );

                if so.F_id >= max then
                    max := so.F_id + 1;
            end;

        UiPanelDstButton_No:
            begin
                pd := TUiPanelDstButton( ui );

                if pd.F_id >= max then
                    max := pd.F_id + 1;
            end;

        UiPanelSrcButton_No:
            begin
                pso := TUiPanelSrcButton( ui );

                if pso.F_id >= max then
                    max := pso.F_id + 1;
            end;

        end;

    end;

    Result := max;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function TScreenList.SearchParent( bType : integer; bId : string; lst : TScreenList ) : integer;
var
    s : TUiFrame;
    i : integer;

begin
    for i:=0 to Count-1 do begin
        s := TUiFrame( Data[i] );

        if (bType = s.FDataType) and (bId = s.F_ParentFrameId) then begin
            lst.Add( s );
        end;
    end;

    Result := lst.Count;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function TScreenList.ScreenDbLoad( fn : string ) : Boolean;
var
    xml : IXMLDocument;
   	cnl, cnl0 : IXMLNodeList;
    j, n : integer;
	a : string;
//    count : array [0..15] of integer;

    s : TScreenDb;

begin
    Result := False;

    // ファイルなし
    if False = FileExists( fn ) then Exit;

    // XML読み込み
    xml	:= LoadXMLDocument( fn );

    // 'ScreenDb'
    cnl0	:= xml.DocumentElement.ChildNodes;

    for j:=0 to cnl0.Count-1 do begin

        a    := cnl0.Nodes[j].NodeName;

        n := AnsiIndexStr( a, FScreenDbTable );
        if n = -1 then begin
            _beep;
            continue;
        end;

//        Inc( count[ n ] );

        cnl		:= cnl0.Nodes[j].ChildNodes;

        case n of
        0:  s := UiFrameLoad( cnl );
        1:  s := UiScreenSelectButtonLoad( cnl );
        2:  s := UiListLoad( cnl );
        3:  s := UiListColumnLoad( cnl );
        4:  s := UiContentLoad( cnl );
        5:  s := UiListCellButtonLoad( cnl );
        6:  s := UiDstButtonLoad( cnl );
        7:  s := UiSrcButtonLoad( cnl );
        8:  s := UiPanelKeyButtonLoad( cnl );
        9:  s := UiPanelDstButtonLoad( cnl );
        10: s := UiPanelSrcButtonLoad( cnl );
        11: s := UiColorSrcKeyButtonLoad( cnl );

        else
            s := nil;
        end;

        if s <> nil then begin
            Add( s );
        end;

    end;

{
    m := 0;
    for j:=0 to HIGH( count ) do begin
        m := m + count[j];
    end;
}
    Result := False;
end;

//------------------------------------------------------------------------------
//  XMLファイル書き込み
//------------------------------------------------------------------------------
procedure TScreenList.ScreenDbSave( fn : string );
var
	XML_Doc     : IXMLDocument;
    s : TScreenDb;
    i : integer;

begin

	// XML書き込み処理
    XML_Doc 			:= TXMLDocument.Create(nil);

	// 出力時にインデント
    XML_Doc.Options 	:= [doNodeAutoIndent];
	XML_Doc.Active  	:= True;
//    XML_Doc.Encoding	:= 'UTF-8';
//    XML_Doc.Version		:= '1.0';

    // ルート
    XML_Doc.AddChild( 'ScreenDb' );

    for i:=0 to Count-1 do begin

        s := {FScreenList.}Data[i];

        case s.FDataType of
        0:  UiFrameSave( XML_Doc, TUiFrame( s ) );
        1:  UiScreenSelectButtonSave( XML_Doc, TUiScreenSelectButton( s ) );
        2:  UiListSave( XML_Doc, TUiList( s ) );
        3:  UiListColumnSave( XML_Doc, TUiListColumn( s ) );
        4:  UiContentSave( XML_Doc, TUiContent( s ) );
        5:  UiListCellButtonSave( XML_Doc, TUiListCellButton( s ) );
        6:  UiDstButtonSave( XML_Doc, TUiDstButton( s ) );
        7:  UiSrcButtonSave( XML_Doc, TUiSrcButton( s ) );
        8:  UiPanelKeyButtonSave( XML_Doc, TUiPanelKeyButton( s ) );
        9:  UiPanelDstButtonSave( XML_Doc, TUiPanelDstButton( s ) );
        10: UiPanelSrcButtonSave( XML_Doc, TUiPanelSrcButton( s ) );
        11: UiColorSrcKeyButtonSave( XML_Doc, TUiColorSrcKeyButton( s ) );
        end;


        XPTLayoutForm.Label1.Caption := Format( '%d/%d', [i, Count] );

    end;

    // 保存
	try
    	if fn <> '' then	XML_Doc.SaveToFile( fn );
    except
		;
    end;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
const
    tbl : array [0..20] of string = (
        'F_Id',
        'F_Note',
        'F_ParentFrameId',
        'F_TitleText',
        'F_TitleBarHeightPix',
        'F_TitleBarVisible',
        'F_BackColor',
        'F_Type',
        'F_Name',
        'F_Attribute',
        'F_ColCount',
        'F_RowCount',
        'F_IsModal',
        'F_Order',
        'F_InnerOrder',
        'F_Left',
        'F_Width',
        'F_Top',
        'F_Height',
        'F_BorderWidth',
        'F_BorderColor'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function TScreenList.UiFrameLoad( cnl : IXMLNodeList ) : TUiFrame;
var
    j : integer;
    str, txt : string;
    u : TUiFrame;

begin

    u := TUiFrame.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl ) of
        0:
            begin
                u.F_Id                  := StrToIntDef( txt, -1 );
                u.E_Id                  := True;
            end;

        1:
            begin
                u.F_Note                := txt;
                u.E_Note                := True;
            end;

        2:
            begin
                u.F_ParentFrameId       := txt;
                u.E_ParentFrameId       := True;
            end;

        3:
            begin
                u.F_TitleText           := txt;
                u.E_TitleText           := True;
            end;

        4:
            begin
                u.F_TitleBarHeightPix   := txt;
                u.E_TitleBarHeightPix   := True;
            end;

        5:
            begin
                u.F_TitleBarVisible     := txt;
                u.E_TitleBarVisible     := True;
            end;

        6:
            begin
                u.F_BackColor           := txt;
                u.E_BackColor           := True;
            end;

        7:
            begin
                u.F_Type                := txt;
                u.E_Type                := True;
            end;

        8:
            begin
                u.F_Name                := txt;
                u.E_Name                := True;
            end;

        9:
            begin
                u.F_Attribute           := txt;
                u.E_Attribute           := True;
            end;

        10:
            begin
                u.F_ColCount            := txt;
                u.E_ColCount            := True;
            end;

        11:
            begin
                u.F_RowCount            := txt;
                u.E_RowCount            := True;
            end;

        12:
            begin
                u.F_IsModal             := txt;
                u.E_IsModal             := True;
            end;

        13:
            begin
                u.F_Order               := txt;
                u.E_Order               := True;
            end;

        14:
            begin
                u.F_InnerOrder          := txt;
                u.E_InnerOrder          := True;
            end;

        15:
            begin
                u.F_Left                := txt;
                u.E_Left                := True;
            end;

        16:
            begin
                u.F_Width               := txt;
                u.E_Width               := True;
            end;

        17:
            begin
                u.F_Top                 := txt;
                u.E_Top                 := True;
            end;

        18:
            begin
                u.F_Height              := txt;
                u.E_Height              := True;
            end;

        19:
            begin
                u.F_BorderWidth         := txt;
                u.E_BorderWidth         := True;
            end;

        20:
            begin
                u.F_BorderColor         := txt;
                u.E_BorderColor         := True;
            end;

        else
            _beep;

        end;
    end;

    Result := u;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TScreenList.UiFrameSave( XML_Doc : IXMLDocument; u : TUiFrame );
var
	XML_rs    	: IXMLNode;
	XML_data2   : IXMLNode;
    x : integer;

begin

    XML_rs := XML_Doc.DocumentElement.AddChild( 'UiFrame' );

    x := 0;

    if True = u.E_Id then begin
        XML_data2 			:= XML_rs.AddChild( tbl[x] );
        XML_data2.NodeValue := u.F_Id;
    end;

    Inc( x );

    if True = u.E_Note then begin
        XML_data2 			:= XML_rs.AddChild( tbl[x] );
        XML_data2.NodeValue := u.F_Note;
    end;

    Inc( x );

    if True = u.E_ParentFrameId then begin
        XML_data2 			:= XML_rs.AddChild( tbl[x] );
        XML_data2.NodeValue := u.F_ParentFrameId;
    end;

    Inc( x );

    if True = u.E_TitleText then begin
        XML_data2 			:= XML_rs.AddChild( tbl[x] );
        XML_data2.NodeValue := u.F_TitleText;
    end;

    Inc( x );

    if True = u.E_TitleBarHeightPix then begin
        XML_data2 			:= XML_rs.AddChild( tbl[x] );
        XML_data2.NodeValue := u.F_TitleBarHeightPix;
    end;

    Inc( x );

    if True = u.E_TitleBarVisible then begin
        XML_data2 			:= XML_rs.AddChild( tbl[x] );
        XML_data2.NodeValue := u.F_TitleBarVisible;
    end;

    Inc( x );

    if True = u.E_BackColor then begin
        XML_data2 			:= XML_rs.AddChild( tbl[x] );
        XML_data2.NodeValue := u.F_BackColor;
    end;

    Inc( x );

    if True = u.E_Type then begin
        XML_data2 			:= XML_rs.AddChild( tbl[x] );
        XML_data2.NodeValue := u.F_Type;
    end;

    Inc( x );

    if True = u.E_Name then begin
        XML_data2 			:= XML_rs.AddChild( tbl[x] );
        XML_data2.NodeValue := u.F_Name;
    end;

    Inc( x );

    if True = u.E_Attribute then begin
        XML_data2 			:= XML_rs.AddChild( tbl[x] );
        XML_data2.NodeValue := u.F_Attribute;
    end;

    Inc( x );

    if True = u.E_ColCount then begin
        XML_data2 			:= XML_rs.AddChild( tbl[x] );
        XML_data2.NodeValue := u.F_ColCount;
    end;

    Inc( x );

    if True = u.E_RowCount then begin
        XML_data2 			:= XML_rs.AddChild( tbl[x] );
        XML_data2.NodeValue := u.F_RowCount;
    end;

    Inc( x );

    if True = u.E_IsModal then begin
        XML_data2 			:= XML_rs.AddChild( tbl[x] );
        XML_data2.NodeValue := u.F_IsModal;
    end;

    Inc( x );

    if True = u.E_Order then begin
        XML_data2 			:= XML_rs.AddChild( tbl[x] );
        XML_data2.NodeValue := u.F_Order;
    end;

    Inc( x );

    if True = u.E_InnerOrder then begin
        XML_data2 			:= XML_rs.AddChild( tbl[x] );
        XML_data2.NodeValue := u.F_InnerOrder;
    end;

    Inc( x );

    if True = u.E_Left then begin
        XML_data2 			:= XML_rs.AddChild( tbl[x] );
        XML_data2.NodeValue := u.F_Left;
    end;

    Inc( x );

    if True = u.E_Width then begin
        XML_data2 			:= XML_rs.AddChild( tbl[x] );
        XML_data2.NodeValue := u.F_Width;
    end;

    Inc( x );

    if True = u.E_Top then begin
        XML_data2 			:= XML_rs.AddChild( tbl[x] );
        XML_data2.NodeValue := u.F_Top;
    end;

    Inc( x );

    if True = u.E_Height then begin
        XML_data2 			:= XML_rs.AddChild( tbl[x] );
        XML_data2.NodeValue := u.F_Height;
    end;

    Inc( x );

    if True = u.E_BorderWidth then begin
        XML_data2 			:= XML_rs.AddChild( tbl[x] );
        XML_data2.NodeValue := u.F_BorderWidth;
    end;

    Inc( x );

    if True = u.E_BorderColor then begin
        XML_data2 			:= XML_rs.AddChild( tbl[x] );
        XML_data2.NodeValue := u.F_BorderColor;
    end;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
const
    tbl1 : array [0..22] of string = (
        'F_Id',
        'F_FrameId',
        'F_Text',
        'F_Key',
        'F_FrameName',
        'F_BeforeRelayKey',
        'F_Attributes',
        'F_Order',
        'F_Left',
        'F_Width',
        'F_Top',
        'F_Height',
        'F_BorderWidth',
        'F_IncludeHeadbar',
        'F_HeadbarColor',
        'F_HeadbarHeight',
        'F_HeadbarText',
        'F_HeadbarFontSize',
        'F_IsPermissionHandled',
        'F_IsSelectionCancel',
        'F_IsDisabled',
        'F_IsListItem',
        'F_FontSize'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function TScreenList.UiScreenSelectButtonLoad( cnl : IXMLNodeList ) : TUiScreenSelectButton;
var
    j : integer;
    str, txt : string;
    u : TUiScreenSelectButton;

begin

    u := TUiScreenSelectButton.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl1 ) of
        0:
            begin
                u.F_Id    := StrToIntDef( txt, -1 );
                u.E_Id    := True;
            end;

        1:
            begin
                u.F_FrameId     := txt;
                u.E_FrameId     := True;
            end;

        2:
            begin
                u.F_Text   := txt;
                u.E_Text   := True;
            end;

        3:
            begin
                u.F_Key   := txt;
                u.E_Key   := True;
            end;

        4:
            begin
                u.F_FrameName   := txt;
                u.E_FrameName   := True;
            end;

        5:
            begin
                u.F_BeforeRelayKey       := txt;
                u.E_BeforeRelayKey       := True;
            end;

        6:
            begin
                u.F_Attributes   := txt;
                u.E_Attributes   := True;
            end;

        7:
            begin
                u.F_Order       := txt;
                u.E_Order       := True;
            end;

        8:
            begin
                u.F_Left        := txt;
                u.E_Left        := True;
            end;

        9:
            begin
                u.F_Width        := txt;
                u.E_Width        := True;
            end;

        10:
            begin
                u.F_Top         := txt;
                u.E_Top         := True;
            end;

        11:
            begin
                u.F_Height      := txt;
                u.E_Height      := True;
            end;

        12:
            begin
                u.F_BorderWidth      := txt;
                u.E_BorderWidth     := True;
            end;

        13:
            begin
                u.F_IncludeHeadbar   := txt;
                u.E_IncludeHeadbar   := True;
            end;

        14:
            begin
                u.F_HeadbarColor   := txt;
                u.E_HeadbarColor   := True;
            end;

        15:
            begin
                u.F_HeadbarHeight   := txt;
                u.E_HeadbarHeight   := True;
            end;

        16:
            begin
                u.F_HeadbarText   := txt;
                u.E_HeadbarText   := True;
            end;

        17:
            begin
                u.F_HeadbarFontSize   := txt;
                u.E_HeadbarFontSize   := True;
            end;

        18:
            begin
                u.F_IsPermissionHandled   := txt;
                u.E_IsPermissionHandled   := True;
            end;

        19:
            begin
                u.F_IsSelectionCancel   := txt;
                u.E_IsSelectionCancel   := True;
            end;

        20:
            begin
                u.F_IsDisabled  := txt;
                u.E_IsDisabled  := True;
            end;

        21:
            begin
                u.F_IsListItem  := txt;
                u.E_IsListItem  := True;
            end;

        22:
            begin
                u.F_FontSize    := txt;
                u.E_FontSize    := True;
            end;

        else
            beep
        end;
    end;

    Result := u;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TScreenList.UiScreenSelectButtonSave( XML_Doc : IXMLDocument; u : TUiScreenSelectButton );
var
	XML_rs    	: IXMLNode;
	XML_data2   : IXMLNode;
    x : integer;

begin

    XML_rs := XML_Doc.DocumentElement.AddChild( 'UiScreenSelectButton' );

    x := 0;

    if True = u.E_Id then begin
        XML_data2 			:= XML_rs.AddChild( tbl1[x] );
        XML_data2.NodeValue := u.F_Id;
    end;

    Inc( x );

    if True = u.E_FrameId then begin
        XML_data2 			:= XML_rs.AddChild( tbl1[x] );
        XML_data2.NodeValue := u.F_FrameId;
    end;

    Inc( x );

    if True = u.E_Text then begin
        XML_data2 			:= XML_rs.AddChild( tbl1[x] );
        XML_data2.NodeValue := u.F_Text;
    end;

    Inc( x );

    if True = u.E_Key then begin
        XML_data2 			:= XML_rs.AddChild( tbl1[x] );
        XML_data2.NodeValue := u.F_Key;
    end;

    Inc( x );

    if True = u.E_FrameName then begin
        XML_data2 			:= XML_rs.AddChild( tbl1[x] );
        XML_data2.NodeValue := u.F_FrameName;
    end;

    Inc( x );

    if True = u.E_BeforeRelayKey then begin
        XML_data2 			:= XML_rs.AddChild( tbl1[x] );
        XML_data2.NodeValue := u.F_BeforeRelayKey;
    end;

    Inc( x );

    if True = u.E_Attributes then begin
        XML_data2 			:= XML_rs.AddChild( tbl1[x] );
        XML_data2.NodeValue := u.F_Attributes;
    end;

    Inc( x );

    if True = u.E_Order then begin
        XML_data2 			:= XML_rs.AddChild( tbl1[x] );
        XML_data2.NodeValue := u.F_Order;
    end;

    Inc( x );

    if True = u.E_Left then begin
        XML_data2 			:= XML_rs.AddChild( tbl1[x] );
        XML_data2.NodeValue := u.F_Left;
    end;

    Inc( x );

    if True = u.E_Width then begin
        XML_data2 			:= XML_rs.AddChild( tbl1[x] );
        XML_data2.NodeValue := u.F_Width;
    end;

    Inc( x );

    if True = u.E_Top then begin
        XML_data2 			:= XML_rs.AddChild( tbl1[x] );
        XML_data2.NodeValue := u.F_Top;
    end;

    Inc( x );

    if True = u.E_Height then begin
        XML_data2 			:= XML_rs.AddChild( tbl1[x] );
        XML_data2.NodeValue := u.F_Height;
    end;

    Inc( x );

    if True = u.E_BorderWidth then begin
        XML_data2 			:= XML_rs.AddChild( tbl1[x] );
        XML_data2.NodeValue := u.F_BorderWidth;
    end;

    Inc( x );

    if True = u.E_IncludeHeadbar then begin
        XML_data2 			:= XML_rs.AddChild( tbl1[x] );
        XML_data2.NodeValue := u.F_IncludeHeadbar;
    end;

    Inc( x );

    if True = u.E_HeadbarColor then begin
        XML_data2 			:= XML_rs.AddChild( tbl1[x] );
        XML_data2.NodeValue := u.F_HeadbarColor;
    end;

    Inc( x );

    if True = u.E_HeadbarHeight then begin
        XML_data2 			:= XML_rs.AddChild( tbl1[x] );
        XML_data2.NodeValue := u.F_HeadbarHeight;
    end;

    Inc( x );

    if True = u.E_HeadbarText then begin
        XML_data2 			:= XML_rs.AddChild( tbl1[x] );
        XML_data2.NodeValue := u.F_HeadbarText;
    end;

    Inc( x );

    if True = u.E_HeadbarFontSize then begin
        XML_data2 			:= XML_rs.AddChild( tbl1[x] );
        XML_data2.NodeValue := u.F_HeadbarFontSize;
    end;

    Inc( x );

    if True = u.E_IsPermissionHandled then begin
        XML_data2 			:= XML_rs.AddChild( tbl1[x] );
        XML_data2.NodeValue := u.F_IsPermissionHandled;
    end;

    Inc( x );

    if True = u.E_IsSelectionCancel then begin
        XML_data2 			:= XML_rs.AddChild( tbl1[x] );
        XML_data2.NodeValue := u.F_IsSelectionCancel;
    end;

    Inc( x );

    if True = u.E_IsDisabled then begin
        XML_data2 			:= XML_rs.AddChild( tbl1[x] );
        XML_data2.NodeValue := u.F_IsDisabled;
    end;

    Inc( x );

    if True = u.E_IsListItem then begin
        XML_data2 			:= XML_rs.AddChild( tbl1[x] );
        XML_data2.NodeValue := u.F_IsListItem;
    end;

    Inc( x );

    if True = u.E_FontSize then begin
        XML_data2 			:= XML_rs.AddChild( tbl1[x] );
        XML_data2.NodeValue := u.F_FontSize;
    end;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
const
    tbl2 : array [0..16] of string = (
        'F_Id',
        'F_FrameId',
        'F_ListType',
        'F_Attributes',
        'F_DefaultSortColumnName',
        'F_AllowMultiSort',
        'F_FilterButtonWidth',
        'F_RowHeight',
        'F_RowHeaderColumnName',
        'F_RowHeaderClickAction',
        'F_ColumnFontSize',
        'F_CellFontSize',
        'F_Order',
        'F_Left',
        'F_Width',
        'F_Top',
        'F_Height'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function TScreenList.UiListLoad( cnl : IXMLNodeList ) : TUiList;
var
    j : integer;
    str, txt : string;
    u : TUiList;

begin

    u := TUiList.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl2 ) of
        0:
            begin
                u.F_Id    := StrToIntDef( txt, -1 );
                u.E_Id    := True;
            end;

        1:
            begin
                u.F_FrameId            := txt;
                u.E_FrameId            := True;
            end;

        2:
            begin
                u.F_ListType        := txt;
                u.E_ListType        := True;
            end;

        3:
            begin
                u.F_Attributes        := txt;
                u.E_Attributes        := True;
            end;

        4:
            begin
                u.F_DefaultSortColumnName     := txt;
                u.E_DefaultSortColumnName     := True;
            end;

        5:
            begin
                u.F_AllowMultiSort   := txt;
                u.E_AllowMultiSort   := True;
            end;

        6:
            begin
                u.F_FilterButtonWidth     := txt;
                u.E_FilterButtonWidth     := True;
            end;

        7:
            begin
                u.F_RowHeight          := txt;
                u.E_RowHeight          := True;
            end;

        8:
            begin
                u.F_RowHeaderColumnName          := txt;
                u.E_RowHeaderColumnName          := True;
            end;

        9:
            begin
                u.F_RowHeaderClickAction          := txt;
                u.E_RowHeaderClickAction          := True;
            end;

        10:
            begin
                u.F_ColumnFontSize          := txt;
                u.E_ColumnFontSize          := True;
            end;

        11:
            begin
                u.F_CellFontSize          := txt;
                u.E_CellFontSize          := True;
            end;

        12:
            begin
                u.F_Order         := txt;
                u.E_Order         := True;
            end;

        13:
            begin
                u.F_Left          := txt;
                u.E_Left          := True;
            end;

        14:
            begin
                u.F_Width         := txt;
                u.E_Width         := True;
            end;

        15:
            begin
                u.F_Top           := txt;
                u.E_Top           := True;
            end;

        16:
            begin
                u.F_Height        := txt;
                u.E_Height        := True;
            end;

        else
            _beep;

        end;
    end;

    Result := u;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TScreenList.UiListSave( XML_Doc : IXMLDocument; u : TUiList );
var
	XML_rs    	: IXMLNode;
	XML_data2   : IXMLNode;
    x : integer;

begin

    XML_rs := XML_Doc.DocumentElement.AddChild( 'UiList' );

    x := 0;

    if True = u.E_Id then begin
        XML_data2 			:= XML_rs.AddChild( tbl2[x] );
        XML_data2.NodeValue := u.F_Id;
    end;

    Inc( x );

    if True = u.E_FrameId then begin
        XML_data2 			:= XML_rs.AddChild( tbl2[x] );
        XML_data2.NodeValue := u.F_FrameId;
    end;

    Inc( x );

    if True = u.E_ListType then begin
        XML_data2 			:= XML_rs.AddChild( tbl2[x] );
        XML_data2.NodeValue := u.F_ListType;
    end;

    Inc( x );

    if True = u.E_Attributes then begin
        XML_data2 			:= XML_rs.AddChild( tbl2[x] );
        XML_data2.NodeValue := u.F_Attributes;
    end;

    Inc( x );

    if True = u.E_DefaultSortColumnName then begin
        XML_data2 			:= XML_rs.AddChild( tbl2[x] );
        XML_data2.NodeValue := u.F_DefaultSortColumnName;
    end;

    Inc( x );

    if True = u.E_AllowMultiSort then begin
        XML_data2 			:= XML_rs.AddChild( tbl2[x] );
        XML_data2.NodeValue := u.F_AllowMultiSort;
    end;

    Inc( x );

    if True = u.E_FilterButtonWidth then begin
        XML_data2 			:= XML_rs.AddChild( tbl2[x] );
        XML_data2.NodeValue := u.F_FilterButtonWidth;
    end;

    Inc( x );

    if True = u.E_RowHeight then begin
        XML_data2 			:= XML_rs.AddChild( tbl2[x] );
        XML_data2.NodeValue := u.F_RowHeight;
    end;

    Inc( x );

    if True = u.E_RowHeaderColumnName then begin
        XML_data2 			:= XML_rs.AddChild( tbl2[x] );
        XML_data2.NodeValue := u.F_RowHeaderColumnName;
    end;

    Inc( x );

    if True = u.E_RowHeaderClickAction then begin
        XML_data2 			:= XML_rs.AddChild( tbl2[x] );
        XML_data2.NodeValue := u.F_RowHeaderClickAction;
    end;

    Inc( x );

    if True = u.E_ColumnFontSize then begin
        XML_data2 			:= XML_rs.AddChild( tbl2[x] );
        XML_data2.NodeValue := u.F_ColumnFontSize;
    end;

    Inc( x );

    if True = u.E_CellFontSize then begin
        XML_data2 			:= XML_rs.AddChild( tbl2[x] );
        XML_data2.NodeValue := u.F_CellFontSize;
    end;

    Inc( x );

    if True = u.E_Order then begin
        XML_data2 			:= XML_rs.AddChild( tbl2[x] );
        XML_data2.NodeValue := u.F_Order;
    end;

    Inc( x );

    if True = u.E_Left then begin
        XML_data2 			:= XML_rs.AddChild( tbl2[x] );
        XML_data2.NodeValue := u.F_Left;
    end;

    Inc( x );

    if True = u.E_Width then begin
        XML_data2 			:= XML_rs.AddChild( tbl2[x] );
        XML_data2.NodeValue := u.F_Width;
    end;

    Inc( x );

    if True = u.E_Top then begin
        XML_data2 			:= XML_rs.AddChild( tbl2[x] );
        XML_data2.NodeValue := u.F_Top;
    end;

    Inc( x );

    if True = u.E_Height then begin
        XML_data2 			:= XML_rs.AddChild( tbl2[x] );
        XML_data2.NodeValue := u.F_Height;
    end;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
const
    tbl3 : array [0..30] of string = (
        'F_Id',
        'F_ListId',
        'F_Order',
        'F_SortOrder',
        'F_Width',
        'F_IsVisible',
        'F_IsReadOnly',
        'F_Text',
        'F_ColName',
        'F_ColAlias',
        'F_ColHeaderClickAction',
        'F_CellType',
        'F_EnumTypeName',
        'F_Format',
        'F_Attribute',
        'F_AllowSort',
        'F_AllowFilter',
        'F_AllowWideChar',
        'F_MaxLangth',
        'F_MaxLengthIsBytes',
        'F_DisplayMaxLineCount',
        'F_ColumnFontSize',
        'F_CellFontSize',
        'F_CellTextHAlign',
        'F_CanReEntry',
        'F_IsCellButtonCol',
        'F_IsRowSelectSync',
        'F_BoolTrueText',
        'F_BoolFalseText',
        'F_IsFontSizeAdjustable',
        'F_FooterText'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function TScreenList.UiListColumnLoad( cnl : IXMLNodeList ) : TUiListColumn;
var
    j : integer;
    str, txt : string;
    u : TUiListColumn;

begin

    u := TUiListColumn.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl3 ) of
        0:
            begin
                u.F_Id    := StrToIntDef( txt, -1 );
                u.E_Id    := True;
            end;

        1:
            begin
                u.F_ListId            := txt;
                u.E_ListId            := True;
            end;

        2:
            begin
                u.F_Order        := txt;
                u.E_Order        := True;
            end;

        3:
            begin
                u.F_SortOrder        := txt;
                u.E_SortOrder        := True;
            end;

        4:
            begin
                u.F_Width        := txt;
                u.E_Width        := True;
            end;

        5:
            begin
                u.F_IsVisible     := txt;
                u.E_IsVisible     := True;
            end;

        6:
            begin
                u.F_IsReadOnly     := txt;
                u.E_IsReadOnly     := True;
            end;

        7:
            begin
                u.F_Text   := txt;
                u.E_Text   := True;
            end;

        8:
            begin
                u.F_ColName     := txt;
                u.E_ColName     := True;
            end;

        9:
            begin
                u.F_ColAlias     := txt;
                u.E_ColAlias     := True;
            end;

        10:
            begin
                u.F_ColHeaderClickAction          := txt;
                u.E_ColHeaderClickAction          := True;
            end;

        11:
            begin
                u.F_CellType          := txt;
                u.E_CellType          := True;
            end;

        12:
            begin
                u.F_EnumTypeName          := txt;
                u.E_EnumTypeName          := True;
            end;

        13:
            begin
                u.F_Format          := txt;
                u.E_Format          := True;
            end;

        14:
            begin
                u.F_Attribute          := txt;
                u.E_Attribute          := True;
            end;

        15:
            begin
                u.F_AllowSort          := txt;
                u.E_AllowSort          := True;
            end;

        16:
            begin
                u.F_AllowFilter          := txt;
                u.E_AllowFilter          := True;
            end;

        17:
            begin
                u.F_AllowWideChar          := txt;
                u.E_AllowWideChar          := True;
            end;

        18:
            begin
                u.F_MaxLangth         := txt;
                u.E_MaxLangth         := True;
            end;

        19:
            begin
                u.F_MaxLengthIsBytes    := txt;
                u.E_MaxLengthIsBytes    := True;
            end;

        20:
            begin
                u.F_DisplayMaxLineCount := txt;
                u.E_DisplayMaxLineCount := True;
            end;

        21:
            begin
                u.F_ColumnFontSize      := txt;
                u.E_ColumnFontSize      := True;
            end;

        22:
            begin
                u.F_CellFontSize        := txt;
                u.E_CellFontSize        := True;
            end;

        23:
            begin
                u.F_CellTextHAlign      := txt;
                u.E_CellTextHAlign      := True;
            end;

        24:
            begin
                u.F_CanReEntry          := txt;
                u.E_CanReEntry          := True;
            end;

        25:
            begin
                u.F_IsCellButtonCol     := txt;
                u.E_IsCellButtonCol     := True;
            end;

        26:
            begin
                u.F_IsRowSelectSync     := txt;
                u.E_IsRowSelectSync     := True;
            end;

        27:
            begin
                u.F_BoolTrueText        := txt;
                u.E_BoolTrueText        := True;
            end;

        28:
            begin
                u.F_BoolFalseText       := txt;
                u.E_BoolFalseText       := True;
            end;

        29:
            begin
                u.F_IsFontSizeAdjustable        := txt;
                u.E_IsFontSizeAdjustable        := True;
            end;

        30:
            begin
                u.F_FooterText          := txt;
                u.E_FooterText          := True;
            end;

        else
            _beep;

        end;
    end;

    Result := u;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TScreenList.UiListColumnSave( XML_Doc : IXMLDocument; u : TUiListColumn );
var
	XML_rs    	: IXMLNode;
	XML_data2   : IXMLNode;
    x : integer;

begin

    XML_rs := XML_Doc.DocumentElement.AddChild( 'UiListColumn' );

    x := 0;

    if True = u.E_Id then begin
        XML_data2 			:= XML_rs.AddChild( tbl3[x] );
        XML_data2.NodeValue := u.F_Id;
    end;

    Inc( x );

    if True = u.E_ListId then begin
        XML_data2 			:= XML_rs.AddChild( tbl3[x] );
        XML_data2.NodeValue := u.F_ListId;
    end;

    Inc( x );

    if True = u.E_Order then begin
        XML_data2 			:= XML_rs.AddChild( tbl3[x] );
        XML_data2.NodeValue := u.F_Order;
    end;

    Inc( x );

    if True = u.E_SortOrder then begin
        XML_data2 			:= XML_rs.AddChild( tbl3[x] );
        XML_data2.NodeValue := u.F_SortOrder;
    end;

    Inc( x );

    if True = u.E_Width then begin
        XML_data2 			:= XML_rs.AddChild( tbl3[x] );
        XML_data2.NodeValue := u.F_Width;
    end;

    Inc( x );

    if True = u.E_IsVisible then begin
        XML_data2 			:= XML_rs.AddChild( tbl3[x] );
        XML_data2.NodeValue := u.F_IsVisible;
    end;

    Inc( x );

    if True = u.E_IsReadOnly then begin
        XML_data2 			:= XML_rs.AddChild( tbl3[x] );
        XML_data2.NodeValue := u.F_IsReadOnly;
    end;

    Inc( x );

    if True = u.E_Text then begin
        XML_data2 			:= XML_rs.AddChild( tbl3[x] );
        XML_data2.NodeValue := u.F_Text;
    end;

    Inc( x );

    if True = u.E_ColName then begin
        XML_data2 			:= XML_rs.AddChild( tbl3[x] );
        XML_data2.NodeValue := u.F_ColName;
    end;

    Inc( x );

    if True = u.E_ColAlias then begin
        XML_data2 			:= XML_rs.AddChild( tbl3[x] );
        XML_data2.NodeValue := u.F_ColAlias;
    end;

    Inc( x );

    if True = u.E_ColHeaderClickAction then begin
        XML_data2 			:= XML_rs.AddChild( tbl3[x] );
        XML_data2.NodeValue := u.F_ColHeaderClickAction;
    end;

    Inc( x );

    if True = u.E_CellType then begin
        XML_data2 			:= XML_rs.AddChild( tbl3[x] );
        XML_data2.NodeValue := u.F_CellType;
    end;

    Inc( x );

    if True = u.E_EnumTypeName then begin
        XML_data2 			:= XML_rs.AddChild( tbl3[x] );
        XML_data2.NodeValue := u.F_EnumTypeName;
    end;

    Inc( x );

    if True = u.E_Format then begin
        XML_data2 			:= XML_rs.AddChild( tbl3[x] );
        XML_data2.NodeValue := u.F_Format;
    end;

    Inc( x );

    if True = u.E_Attribute then begin
        XML_data2 			:= XML_rs.AddChild( tbl3[x] );
        XML_data2.NodeValue := u.F_Attribute;
    end;

    Inc( x );

    if True = u.E_AllowSort then begin
        XML_data2 			:= XML_rs.AddChild( tbl3[x] );
        XML_data2.NodeValue := u.F_AllowSort;
    end;

    Inc( x );

    if True = u.E_AllowFilter then begin
        XML_data2 			:= XML_rs.AddChild( tbl3[x] );
        XML_data2.NodeValue := u.F_AllowFilter;
    end;

    Inc( x );

    if True = u.E_AllowWideChar then begin
        XML_data2 			:= XML_rs.AddChild( tbl3[x] );
        XML_data2.NodeValue := u.F_AllowWideChar;
    end;

    Inc( x );

    if True = u.E_MaxLangth then begin
        XML_data2 			:= XML_rs.AddChild( tbl3[x] );
        XML_data2.NodeValue := u.F_MaxLangth;
    end;

    Inc( x );

    if True = u.E_MaxLengthIsBytes then begin
        XML_data2 			:= XML_rs.AddChild( tbl3[x] );
        XML_data2.NodeValue := u.F_MaxLengthIsBytes;
    end;

    Inc( x );

    if True = u.E_DisplayMaxLineCount then begin
        XML_data2 			:= XML_rs.AddChild( tbl3[x] );
        XML_data2.NodeValue := u.F_DisplayMaxLineCount;
    end;

    Inc( x );

    if True = u.E_ColumnFontSize then begin
        XML_data2 			:= XML_rs.AddChild( tbl3[x] );
        XML_data2.NodeValue := u.F_ColumnFontSize;
    end;

    Inc( x );

    if True = u.E_CellFontSize then begin
        XML_data2 			:= XML_rs.AddChild( tbl3[x] );
        XML_data2.NodeValue := u.F_CellFontSize;
    end;

    Inc( x );

    if True = u.E_CellTextHAlign then begin
        XML_data2 			:= XML_rs.AddChild( tbl3[x] );
        XML_data2.NodeValue := u.F_CellTextHAlign;
    end;

    Inc( x );

    if True = u.E_CanReEntry then begin
        XML_data2 			:= XML_rs.AddChild( tbl3[x] );
        XML_data2.NodeValue := u.F_CanReEntry;
    end;

    Inc( x );

    if True = u.E_IsCellButtonCol then begin
        XML_data2 			:= XML_rs.AddChild( tbl3[x] );
        XML_data2.NodeValue := u.F_IsCellButtonCol;
    end;

    Inc( x );

    if True = u.E_IsRowSelectSync then begin
        XML_data2 			:= XML_rs.AddChild( tbl3[x] );
        XML_data2.NodeValue := u.F_IsRowSelectSync;
    end;

    Inc( x );

    if True = u.E_BoolTrueText then begin
        XML_data2 			:= XML_rs.AddChild( tbl3[x] );
        XML_data2.NodeValue := u.F_BoolTrueText;
    end;

    Inc( x );

    if True = u.E_BoolFalseText then begin
        XML_data2 			:= XML_rs.AddChild( tbl3[x] );
        XML_data2.NodeValue := u.F_BoolFalseText;
    end;

    Inc( x );

    if True = u.E_IsFontSizeAdjustable then begin
        XML_data2 			:= XML_rs.AddChild( tbl3[x] );
        XML_data2.NodeValue := u.F_IsFontSizeAdjustable;
    end;

    Inc( x );

    if True = u.E_FooterText then begin
        XML_data2 			:= XML_rs.AddChild( tbl3[x] );
        XML_data2.NodeValue := u.F_FooterText;
    end;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
const
    tbl4 : array [0..11] of string = (
        'F_Id',
        'F_FrameId',
        'F_Text',
        'F_UiType',
        'F_Name',
        'F_Attributes',
        'F_Order',
        'F_Left',
        'F_Width',
        'F_Top',
        'F_Height',
        'F_BorderWidth'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function TScreenList.UiContentLoad( cnl : IXMLNodeList ) : TUiContent;
var
    j : integer;
    str, txt : string;
    u : TUiContent;

begin

    u := TUiContent.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl4 ) of
        0:
            begin
                u.F_Id    := StrToIntDef( txt, -1 );
                u.E_Id    := True;
            end;

        1:
            begin
                u.F_FrameId            := txt;
                u.E_FrameId            := True;
            end;

        2:
            begin
                u.F_Text        := txt;
                u.E_Text        := True;
            end;

        3:
            begin
                u.F_UiType        := txt;
                u.E_UiType        := True;
            end;

        4:
            begin
                u.F_Name        := txt;
                u.E_Name        := True;
            end;

        5:
            begin
                u.F_Attributes        := txt;
                u.E_Attributes        := True;
            end;

        6:
            begin
                u.F_Order        := txt;
                u.E_Order        := True;
            end;

        7:
            begin
                u.F_Left     := txt;
                u.E_Left     := True;
            end;

        8:
            begin
                u.F_Width     := txt;
                u.E_Width     := True;
            end;

        9:
            begin
                u.F_Top   := txt;
                u.E_Top   := True;
            end;

        10:
            begin
                u.F_Height     := txt;
                u.E_Height     := True;
            end;

        11:
            begin
                u.F_BorderWidth     := txt;
                u.E_BorderWidth     := True;
            end;

        else
            _beep;

        end;
    end;

    Result := u;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TScreenList.UiContentSave( XML_Doc : IXMLDocument; u : TUiContent );
var
	XML_rs    	: IXMLNode;
	XML_data2   : IXMLNode;
    x : integer;

begin

    XML_rs := XML_Doc.DocumentElement.AddChild( 'UiContent' );

    x := 0;

    if True = u.E_Id then begin
        XML_data2 			:= XML_rs.AddChild( tbl4[x] );
        XML_data2.NodeValue := u.F_Id;
    end;

    Inc( x );

    if True = u.E_FrameId then begin
        XML_data2 			:= XML_rs.AddChild( tbl4[x] );
        XML_data2.NodeValue := u.F_FrameId;
    end;

    Inc( x );

    if True = u.E_Text then begin
        XML_data2 			:= XML_rs.AddChild( tbl4[x] );
        XML_data2.NodeValue := u.F_Text;
    end;

    Inc( x );

    if True = u.E_UiType then begin
        XML_data2 			:= XML_rs.AddChild( tbl4[x] );
        XML_data2.NodeValue := u.F_UiType;
    end;

    Inc( x );

    if True = u.E_Name then begin
        XML_data2 			:= XML_rs.AddChild( tbl4[x] );
        XML_data2.NodeValue := u.F_Name;
    end;

    Inc( x );

    if True = u.E_Attributes then begin
        XML_data2 			:= XML_rs.AddChild( tbl4[x] );
        XML_data2.NodeValue := u.F_Attributes;
    end;

    Inc( x );

    if True = u.E_Order then begin
        XML_data2 			:= XML_rs.AddChild( tbl4[x] );
        XML_data2.NodeValue := u.F_Order;
    end;

    Inc( x );

    if True = u.E_Left then begin
        XML_data2 			:= XML_rs.AddChild( tbl4[x] );
        XML_data2.NodeValue := u.F_Left;
    end;

    Inc( x );

    if True = u.E_Width then begin
        XML_data2 			:= XML_rs.AddChild( tbl4[x] );
        XML_data2.NodeValue := u.F_Width;
    end;

    Inc( x );

    if True = u.E_Top then begin
        XML_data2 			:= XML_rs.AddChild( tbl4[x] );
        XML_data2.NodeValue := u.F_Top;
    end;

    Inc( x );

    if True = u.E_Height then begin
        XML_data2 			:= XML_rs.AddChild( tbl4[x] );
        XML_data2.NodeValue := u.F_Height;
    end;

    Inc( x );

    if True = u.E_BorderWidth then begin
        XML_data2 			:= XML_rs.AddChild( tbl4[x] );
        XML_data2.NodeValue := u.F_BorderWidth;
    end;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
const
    tbl5 : array [0..10] of string = (
        'F_Id',
        'F_ColumnId',
        'F_Order',
        'F_Width',
        'F_Text',
        'F_ClickAction',
        'F_IsDefaultRowVisible',
        'F_IsStandartRowVisible',
        'F_FontSize',
        'F_IsRowSelectSync',
        'F_HeadbarHeight'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function TScreenList.UiListCellButtonLoad( cnl : IXMLNodeList ) : TUiListCellButton;
var
    j : integer;
    str, txt : string;
    u : TUiListCellButton;

begin

    u := TUiListCellButton.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl5 ) of
        0:
            begin
                u.F_Id    := StrToIntDef( txt, -1 );
                u.E_Id    := True;
            end;

        1:
            begin
                u.F_ColumnId            := txt;
                u.E_ColumnId            := True;
            end;

        2:
            begin
                u.F_Order        := txt;
                u.E_Order        := True;
            end;

        3:
            begin
                u.F_Width        := txt;
                u.E_Width        := True;
            end;

        4:
            begin
                u.F_Text        := txt;
                u.E_Text        := True;
            end;

        5:
            begin
                u.F_ClickAction        := txt;
                u.E_ClickAction        := True;
            end;

        6:
            begin
                u.F_IsDefaultRowVisible        := txt;
                u.E_IsDefaultRowVisible        := True;
            end;

        7:
            begin
                u.F_IsStandartRowVisible     := txt;
                u.E_IsStandartRowVisible     := True;
            end;

        8:
            begin
                u.F_FontSize            := txt;
                u.E_FontSize            := True;
            end;

        9:
            begin
                u.F_IsRowSelectSync     := txt;
                u.E_IsRowSelectSync     := True;
            end;

        10:
            begin
                u.F_HeadbarHeight       := txt;
                u.E_HeadbarHeight       := True;
            end;

        else
            _beep;

        end;
    end;

    Result := u;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TScreenList.UiListCellButtonSave( XML_Doc : IXMLDocument; u : TUiListCellButton );
var
	XML_rs    	: IXMLNode;
	XML_data2   : IXMLNode;
    x : integer;

begin

    XML_rs := XML_Doc.DocumentElement.AddChild( 'UiListCellButton' );

    x := 0;

    if True = u.E_Id then begin
        XML_data2 			:= XML_rs.AddChild( tbl5[x] );
        XML_data2.NodeValue := u.F_Id;
    end;

    Inc( x );

    if True = u.E_ColumnId then begin
        XML_data2 			:= XML_rs.AddChild( tbl5[x] );
        XML_data2.NodeValue := u.F_ColumnId;
    end;

    Inc( x );

    if True = u.E_Order then begin
        XML_data2 			:= XML_rs.AddChild( tbl5[x] );
        XML_data2.NodeValue := u.F_Order;
    end;

    Inc( x );

    if True = u.E_Width then begin
        XML_data2 			:= XML_rs.AddChild( tbl5[x] );
        XML_data2.NodeValue := u.F_Width;
    end;

    Inc( x );

    if True = u.E_Text then begin
        XML_data2 			:= XML_rs.AddChild( tbl5[x] );
        XML_data2.NodeValue := u.F_Text;
    end;

    Inc( x );

    if True = u.E_ClickAction then begin
        XML_data2 			:= XML_rs.AddChild( tbl5[x] );
        XML_data2.NodeValue := u.F_ClickAction;
    end;

    Inc( x );

    if True = u.E_IsDefaultRowVisible then begin
        XML_data2 			:= XML_rs.AddChild( tbl5[x] );
        XML_data2.NodeValue := u.F_IsDefaultRowVisible;
    end;

    Inc( x );

    if True = u.E_IsStandartRowVisible then begin
        XML_data2 			:= XML_rs.AddChild( tbl5[x] );
        XML_data2.NodeValue := u.F_IsStandartRowVisible;
    end;

    Inc( x );

    if True = u.E_FontSize then begin
        XML_data2 			:= XML_rs.AddChild( tbl5[x] );
        XML_data2.NodeValue := u.F_FontSize;
    end;

    Inc( x );

    if True = u.E_IsRowSelectSync then begin
        XML_data2 			:= XML_rs.AddChild( tbl5[x] );
        XML_data2.NodeValue := u.F_IsRowSelectSync;
    end;

    Inc( x );

    if True = u.E_HeadbarHeight then begin
        XML_data2 			:= XML_rs.AddChild( tbl5[x] );
        XML_data2.NodeValue := u.F_HeadbarHeight;
    end;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
const
    tbl6 : array [0..16] of string = (
        'F_Id',
        'F_FrameId',
        'F_DstPortNo',
        'F_IsListItem',
        'F_DstHeightPx',
        'F_FontSize',
        'F_Order',
        'F_Left',
        'F_Width',
        'F_Top',
        'F_Height',
        'F_BorderWidth',
        'F_IsDisabled',
        'F_SystemModeBitMask',
        'F_Attrubute',
        'F_IsHeadBarHidden',
        'F_DstFontSize'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function TScreenList.UiDstButtonLoad( cnl : IXMLNodeList ) : TUiDstButton;
var
    j : integer;
    str, txt : string;
    u : TUiDstButton;

begin

    u := TUiDstButton.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl6 ) of
        0:
            begin
                u.F_Id    := StrToIntDef( txt, -1 );
                u.E_Id    := True;
            end;

        1:
            begin
                u.F_FrameId            := txt;
                u.E_FrameId            := True;
            end;

        2:
            begin
                u.F_DstPortNo            := txt;
                u.E_DstPortNo            := True;
            end;

        3:
            begin
                u.F_IsListItem            := txt;
                u.E_IsListItem            := True;
            end;

        4:
            begin
                u.F_DstHeightPx            := txt;
                u.E_DstHeightPx            := True;
            end;

        5:
            begin
                u.F_FontSize            := txt;
                u.E_FontSize            := True;
            end;

        6:
            begin
                u.F_Order        := txt;
                u.E_Order        := True;
            end;

        7:
            begin
                u.F_Left        := txt;
                u.E_Left        := True;
            end;

        8:
            begin
                u.F_Width        := txt;
                u.E_Width        := True;
            end;

        9:
            begin
                u.F_Top        := txt;
                u.E_Top        := True;
            end;

        10:
            begin
                u.F_Height        := txt;
                u.E_Height        := True;
            end;

        11:
            begin
                u.F_BorderWidth         := txt;
                u.E_BorderWidth         := True;
            end;

        12:
            begin
                u.F_IsDisabled          := txt;
                u.E_IsDisabled          := True;
            end;

        13:
            begin
                u.F_SystemModeBitMask   := txt;
                u.E_SystemModeBitMask   := True;
            end;

        14:
            begin
                u.F_Attrubute           := txt;
                u.E_Attrubute           := True;
            end;

        15:
            begin
                u.F_IsHeadBarHidden     := txt;
                u.E_IsHeadBarHidden     := True;
            end;

        16:
            begin
                u.F_DstFontSize         := txt;
                u.E_DstFontSize         := True;
            end;

        else
            _beep;

        end;
    end;

    Result := u;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TScreenList.UiDstButtonSave( XML_Doc : IXMLDocument; u : TUiDstButton );
var
	XML_rs    	: IXMLNode;
	XML_data2   : IXMLNode;
    x : integer;

begin

    XML_rs := XML_Doc.DocumentElement.AddChild( 'UiDstButton' );

    x := 0;

    if True = u.E_Id then begin
        XML_data2 			:= XML_rs.AddChild( tbl6[x] );
        XML_data2.NodeValue := u.F_Id;
    end;

    Inc( x );

    if True = u.E_FrameId then begin
        XML_data2 			:= XML_rs.AddChild( tbl6[x] );
        XML_data2.NodeValue := u.F_FrameId;
    end;

    Inc( x );

    if True = u.E_DstPortNo then begin
        XML_data2 			:= XML_rs.AddChild( tbl6[x] );
        XML_data2.NodeValue := u.F_DstPortNo;
    end;

    Inc( x );

    if True = u.E_IsListItem then begin
        XML_data2 			:= XML_rs.AddChild( tbl6[x] );
        XML_data2.NodeValue := u.F_IsListItem;
    end;

    Inc( x );

    if True = u.E_DstHeightPx then begin
        XML_data2 			:= XML_rs.AddChild( tbl6[x] );
        XML_data2.NodeValue := u.F_DstHeightPx;
    end;

    Inc( x );

    if True = u.E_FontSize then begin
        XML_data2 			:= XML_rs.AddChild( tbl6[x] );
        XML_data2.NodeValue := u.F_FontSize;
    end;

    Inc( x );

    if True = u.E_Order then begin
        XML_data2 			:= XML_rs.AddChild( tbl6[x] );
        XML_data2.NodeValue := u.F_Order;
    end;

    Inc( x );

    if True = u.E_Left then begin
        XML_data2 			:= XML_rs.AddChild( tbl6[x] );
        XML_data2.NodeValue := u.F_Left;
    end;

    Inc( x );

    if True = u.E_Width then begin
        XML_data2 			:= XML_rs.AddChild( tbl6[x] );
        XML_data2.NodeValue := u.F_Width;
    end;

    Inc( x );

    if True = u.E_Top then begin
        XML_data2 			:= XML_rs.AddChild( tbl6[x] );
        XML_data2.NodeValue := u.F_Top;
    end;

    Inc( x );

    if True = u.E_Height then begin
        XML_data2 			:= XML_rs.AddChild( tbl6[x] );
        XML_data2.NodeValue := u.F_Height;
    end;

    Inc( x );

    if True = u.E_BorderWidth then begin
        XML_data2 			:= XML_rs.AddChild( tbl6[x] );
        XML_data2.NodeValue := u.F_BorderWidth;
    end;

    Inc( x );

    if True = u.E_IsDisabled then begin
        XML_data2 			:= XML_rs.AddChild( tbl6[x] );
        XML_data2.NodeValue := u.F_IsDisabled;
    end;

    Inc( x );

    if True = u.E_SystemModeBitMask then begin
        XML_data2 			:= XML_rs.AddChild( tbl6[x] );
        XML_data2.NodeValue := u.F_SystemModeBitMask;
    end;

    Inc( x );

    if True = u.E_Attrubute then begin
        XML_data2 			:= XML_rs.AddChild( tbl6[x] );
        XML_data2.NodeValue := u.F_Attrubute;
    end;

    Inc( x );

    if True = u.E_IsHeadBarHidden then begin
        XML_data2 			:= XML_rs.AddChild( tbl6[x] );
        XML_data2.NodeValue := u.F_IsHeadBarHidden;
    end;

    Inc( x );

    if True = u.E_DstFontSize then begin
        XML_data2 			:= XML_rs.AddChild( tbl6[x] );
        XML_data2.NodeValue := u.F_DstFontSize;
    end;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
const
    tbl7 : array [0..10] of string = (
        'F_Id',
        'F_FrameId',
        'F_SrcPortNo',
        'F_Order',
        'F_Left',
        'F_Width',
        'F_Top',
        'F_Height',
        'F_SystemModeBitMask',
        'F_FontSize',
        'F_Attribute'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function TScreenList.UiSrcButtonLoad( cnl : IXMLNodeList ) : TUiSrcButton;
var
    j : integer;
    str, txt : string;
    u : TUiSrcButton;

begin

    u := TUiSrcButton.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl7 ) of
        0:
            begin
                u.F_Id    := StrToIntDef( txt, -1 );
                u.E_Id    := True;
            end;

        1:
            begin
                u.F_FrameId            := txt;
                u.E_FrameId            := True;
            end;

        2:
            begin
                u.F_SrcPortNo            := txt;
                u.E_SrcPortNo            := True;
            end;

        3:
            begin
                u.F_Order        := txt;
                u.E_Order        := True;
            end;

        4:
            begin
                u.F_Left        := txt;
                u.E_Left        := True;
            end;

        5:
            begin
                u.F_Width        := txt;
                u.E_Width        := True;
            end;

        6:
            begin
                u.F_Top        := txt;
                u.E_Top        := True;
            end;

        7:
            begin
                u.F_Height        := txt;
                u.E_Height        := True;
            end;

        8:
            begin
                u.F_SystemModeBitMask        := txt;
                u.E_SystemModeBitMask        := True;
            end;

        9:
            begin
                u.F_FontSize        := txt;
                u.E_FontSize        := True;
            end;

        10:
            begin
                u.F_Attribute        := txt;
                u.E_Attribute        := True;
            end;

        else
            _beep;

        end;
    end;

    Result := u;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TScreenList.UiSrcButtonSave( XML_Doc : IXMLDocument; u : TUiSrcButton );
var
	XML_rs    	: IXMLNode;
	XML_data2   : IXMLNode;
    x : integer;

begin

    XML_rs := XML_Doc.DocumentElement.AddChild( 'UiSrcButton' );

    x := 0;

    if True = u.E_Id then begin
        XML_data2 			:= XML_rs.AddChild( tbl7[x] );
        XML_data2.NodeValue := u.F_Id;
    end;

    Inc( x );

    if True = u.E_FrameId then begin
        XML_data2 			:= XML_rs.AddChild( tbl7[x] );
        XML_data2.NodeValue := u.F_FrameId;
    end;

    Inc( x );

    if True = u.E_SrcPortNo then begin
        XML_data2 			:= XML_rs.AddChild( tbl7[x] );
        XML_data2.NodeValue := u.F_SrcPortNo;
    end;

    Inc( x );

    if True = u.E_Order then begin
        XML_data2 			:= XML_rs.AddChild( tbl7[x] );
        XML_data2.NodeValue := u.F_Order;
    end;

    Inc( x );

    if True = u.E_Left then begin
        XML_data2 			:= XML_rs.AddChild( tbl7[x] );
        XML_data2.NodeValue := u.F_Left;
    end;

    Inc( x );

    if True = u.E_Width then begin
        XML_data2 			:= XML_rs.AddChild( tbl7[x] );
        XML_data2.NodeValue := u.F_Width;
    end;

    Inc( x );

    if True = u.E_Top then begin
        XML_data2 			:= XML_rs.AddChild( tbl7[x] );
        XML_data2.NodeValue := u.F_Top;
    end;

    Inc( x );

    if True = u.E_Height then begin
        XML_data2 			:= XML_rs.AddChild( tbl7[x] );
        XML_data2.NodeValue := u.F_Height;
    end;

    Inc( x );

    if True = u.E_SystemModeBitMask then begin
        XML_data2 			:= XML_rs.AddChild( tbl7[x] );
        XML_data2.NodeValue := u.F_SystemModeBitMask;
    end;

    Inc( x );

    if True = u.E_FontSize then begin
        XML_data2 			:= XML_rs.AddChild( tbl7[x] );
        XML_data2.NodeValue := u.F_FontSize;
    end;

    Inc( x );

    if True = u.E_Attribute then begin
        XML_data2 			:= XML_rs.AddChild( tbl7[x] );
        XML_data2.NodeValue := u.F_Attribute;
    end;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
const
    tbl8 : array [0..12] of string = (
        'F_Id',
        'F_FrameId',
        'F_ButtonNo',
        'F_DstAssignDisable',
        'F_SrcAssignDisable',
        'F_CopyButtonNo',
        'F_SyncPageRange',
        'F_DispMode',
        'F_Order',
        'F_Left',
        'F_Width',
        'F_Top',
        'F_Height'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function TScreenList.UiPanelKeyButtonLoad( cnl : IXMLNodeList ) : TUiPanelKeyButton;
var
    j : integer;
    str, txt : string;
    u : TUiPanelKeyButton;

begin

    u := TUiPanelKeyButton.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl8 ) of
        0:
            begin
                u.F_Id    := StrToIntDef( txt, -1 );
                u.E_Id    := True;
            end;

        1:
            begin
                u.F_FrameId            := txt;
                u.E_FrameId            := True;
            end;

        2:
            begin
                u.F_ButtonNo            := txt;
                u.E_ButtonNo            := True;
            end;

        3:
            begin
                u.F_DstAssignDisable            := txt;
                u.E_DstAssignDisable            := True;
            end;

        4:
            begin
                u.F_SrcAssignDisable            := txt;
                u.E_SrcAssignDisable            := True;
            end;

        5:
            begin
                u.F_CopyButtonNo            := txt;
                u.E_CopyButtonNo            := True;
            end;

        6:
            begin
                u.F_SyncPageRange            := txt;
                u.E_SyncPageRange            := True;
            end;

        7:
            begin
                u.F_DispMode        := txt;
                u.E_DispMode        := True;
            end;

        8:
            begin
                u.F_Order        := txt;
                u.E_Order        := True;
            end;

        9:
            begin
                u.F_Left        := txt;
                u.E_Left        := True;
            end;

        10:
            begin
                u.F_Width        := txt;
                u.E_Width        := True;
            end;

        11:
            begin
                u.F_Top        := txt;
                u.E_Top        := True;
            end;

        12:
            begin
                u.F_Height        := txt;
                u.E_Height        := True;
            end;

        else
            _beep;

        end;
    end;

    Result := u;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TScreenList.UiPanelKeyButtonSave( XML_Doc : IXMLDocument; u : TUiPanelKeyButton );
var
	XML_rs    	: IXMLNode;
	XML_data2   : IXMLNode;
    x : integer;

begin

    XML_rs := XML_Doc.DocumentElement.AddChild( 'UiPanelKeyButton' );

    x := 0;

    if True = u.E_Id then begin
        XML_data2 			:= XML_rs.AddChild( tbl8[x] );
        XML_data2.NodeValue := u.F_Id;
    end;

    Inc( x );

    if True = u.E_FrameId then begin
        XML_data2 			:= XML_rs.AddChild( tbl8[x] );
        XML_data2.NodeValue := u.F_FrameId;
    end;

    Inc( x );

    if True = u.E_ButtonNo then begin
        XML_data2 			:= XML_rs.AddChild( tbl8[x] );
        XML_data2.NodeValue := u.F_ButtonNo;
    end;

    Inc( x );

    if True = u.E_DstAssignDisable then begin
        XML_data2 			:= XML_rs.AddChild( tbl8[x] );
        XML_data2.NodeValue := u.F_DstAssignDisable;
    end;

    Inc( x );

    if True = u.E_SrcAssignDisable then begin
        XML_data2 			:= XML_rs.AddChild( tbl8[x] );
        XML_data2.NodeValue := u.F_SrcAssignDisable;
    end;

    Inc( x );

    if True = u.E_CopyButtonNo then begin
        XML_data2 			:= XML_rs.AddChild( tbl8[x] );
        XML_data2.NodeValue := u.F_CopyButtonNo;
    end;

    Inc( x );

    if True = u.E_SyncPageRange then begin
        XML_data2 			:= XML_rs.AddChild( tbl8[x] );
        XML_data2.NodeValue := u.F_SyncPageRange;
    end;

    Inc( x );

    if True = u.E_DispMode then begin
        XML_data2 			:= XML_rs.AddChild( tbl8[x] );
        XML_data2.NodeValue := u.F_DispMode;
    end;

    Inc( x );

    if True = u.E_Order then begin
        XML_data2 			:= XML_rs.AddChild( tbl8[x] );
        XML_data2.NodeValue := u.F_Order;
    end;

    Inc( x );

    if True = u.E_Left then begin
        XML_data2 			:= XML_rs.AddChild( tbl8[x] );
        XML_data2.NodeValue := u.F_Left;
    end;

    Inc( x );

    if True = u.E_Width then begin
        XML_data2 			:= XML_rs.AddChild( tbl8[x] );
        XML_data2.NodeValue := u.F_Width;
    end;

    Inc( x );

    if True = u.E_Top then begin
        XML_data2 			:= XML_rs.AddChild( tbl8[x] );
        XML_data2.NodeValue := u.F_Top;
    end;

    Inc( x );

    if True = u.E_Height then begin
        XML_data2 			:= XML_rs.AddChild( tbl8[x] );
        XML_data2.NodeValue := u.F_Height;
    end;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
const
    tbl9 : array [0..9] of string = (
        'F_Id',
        'F_FrameId',
        'F_DstPortNo',
        'F_Order',
        'F_Left',
        'F_Width',
        'F_Top',
        'F_Height',
        'F_BorderWidth',
        'F_SystemModeBitMask'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function TScreenList.UiPanelDstButtonLoad( cnl : IXMLNodeList ) : TUiPanelDstButton;
var
    j : integer;
    str, txt : string;
    u : TUiPanelDstButton;

begin

    u := TUiPanelDstButton.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl9 ) of
        0:
            begin
                u.F_Id    := StrToIntDef( txt, -1 );
                u.E_Id    := True;
            end;

        1:
            begin
                u.F_FrameId            := txt;
                u.E_FrameId            := True;
            end;

        2:
            begin
                u.F_DstPortNo            := txt;
                u.E_DstPortNo            := True;
            end;

        3:
            begin
                u.F_Order        := txt;
                u.E_Order        := True;
            end;

        4:
            begin
                u.F_Left        := txt;
                u.E_Left        := True;
            end;

        5:
            begin
                u.F_Width        := txt;
                u.E_Width        := True;
            end;

        6:
            begin
                u.F_Top        := txt;
                u.E_Top        := True;
            end;

        7:
            begin
                u.F_Height        := txt;
                u.E_Height        := True;
            end;

        8:
            begin
                u.F_BorderWidth        := txt;
                u.E_BorderWidth        := True;
            end;

        9:
            begin
                u.F_SystemModeBitMask        := txt;
                u.E_SystemModeBitMask        := True;
            end;

        else
            _beep;

        end;
    end;

    Result := u;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TScreenList.UiPanelDstButtonSave( XML_Doc : IXMLDocument; u : TUiPanelDstButton );
var
	XML_rs    	: IXMLNode;
	XML_data2   : IXMLNode;
    x : integer;

begin

    XML_rs := XML_Doc.DocumentElement.AddChild( 'UiPanelDstButton' );

    x := 0;

    if True = u.E_Id then begin
        XML_data2 			:= XML_rs.AddChild( tbl9[x] );
        XML_data2.NodeValue := u.F_Id;
    end;

    Inc( x );

    if True = u.E_FrameId then begin
        XML_data2 			:= XML_rs.AddChild( tbl9[x] );
        XML_data2.NodeValue := u.F_FrameId;
    end;

    Inc( x );

    if True = u.E_DstPortNo then begin
        XML_data2 			:= XML_rs.AddChild( tbl9[x] );
        XML_data2.NodeValue := u.F_DstPortNo;
    end;

    Inc( x );

    if True = u.E_Order then begin
        XML_data2 			:= XML_rs.AddChild( tbl9[x] );
        XML_data2.NodeValue := u.F_Order;
    end;

    Inc( x );

    if True = u.E_Left then begin
        XML_data2 			:= XML_rs.AddChild( tbl9[x] );
        XML_data2.NodeValue := u.F_Left;
    end;

    Inc( x );

    if True = u.E_Width then begin
        XML_data2 			:= XML_rs.AddChild( tbl9[x] );
        XML_data2.NodeValue := u.F_Width;
    end;

    Inc( x );

    if True = u.E_Top then begin
        XML_data2 			:= XML_rs.AddChild( tbl9[x] );
        XML_data2.NodeValue := u.F_Top;
    end;

    Inc( x );

    if True = u.E_Height then begin
        XML_data2 			:= XML_rs.AddChild( tbl9[x] );
        XML_data2.NodeValue := u.F_Height;
    end;

    Inc( x );

    if True = u.E_BorderWidth then begin
        XML_data2 			:= XML_rs.AddChild( tbl9[x] );
        XML_data2.NodeValue := u.F_BorderWidth;
    end;

    Inc( x );

    if True = u.E_SystemModeBitMask then begin
        XML_data2 			:= XML_rs.AddChild( tbl9[x] );
        XML_data2.NodeValue := u.F_SystemModeBitMask;
    end;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
const
    tbl10 : array [0..8] of string = (
        'F_Id',
        'F_FrameId',
        'F_SrcPortNo',
        'F_Order',
        'F_Left',
        'F_Width',
        'F_Top',
        'F_Height',
        'F_SystemModeBitMask'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function TScreenList.UiPanelSrcButtonLoad( cnl : IXMLNodeList ) : TUiPanelSrcButton;
var
    j : integer;
    str, txt : string;
    u : TUiPanelSrcButton;

begin

    u := TUiPanelSrcButton.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl10 ) of
        0:
            begin
                u.F_Id    := StrToIntDef( txt, -1 );
                u.E_Id    := True;
            end;

        1:
            begin
                u.F_FrameId            := txt;
                u.E_FrameId            := True;
            end;

        2:
            begin
                u.F_SrcPortNo            := txt;
                u.E_SrcPortNo            := True;
            end;

        3:
            begin
                u.F_Order        := txt;
                u.E_Order        := True;
            end;

        4:
            begin
                u.F_Left        := txt;
                u.E_Left        := True;
            end;

        5:
            begin
                u.F_Width        := txt;
                u.E_Width        := True;
            end;

        6:
            begin
                u.F_Top        := txt;
                u.E_Top        := True;
            end;

        7:
            begin
                u.F_Height        := txt;
                u.E_Height        := True;
            end;

        8:
            begin
                u.F_SystemModeBitMask        := txt;
                u.E_SystemModeBitMask        := True;
            end;

        else
            _beep;

        end;
    end;

    Result := u;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TScreenList.UiPanelSrcButtonSave( XML_Doc : IXMLDocument; u : TUiPanelSrcButton );
var
	XML_rs    	: IXMLNode;
	XML_data2   : IXMLNode;
    x : integer;

begin

    XML_rs := XML_Doc.DocumentElement.AddChild( 'UiPanelSrcButton' );

    x := 0;

    if True = u.E_Id then begin
        XML_data2 			:= XML_rs.AddChild( tbl10[x] );
        XML_data2.NodeValue := u.F_Id;
    end;

    Inc( x );

    if True = u.E_FrameId then begin
        XML_data2 			:= XML_rs.AddChild( tbl10[x] );
        XML_data2.NodeValue := u.F_FrameId;
    end;

    Inc( x );

    if True = u.E_SrcPortNo then begin
        XML_data2 			:= XML_rs.AddChild( tbl10[x] );
        XML_data2.NodeValue := u.F_SrcPortNo;
    end;

    Inc( x );

    if True = u.E_Order then begin
        XML_data2 			:= XML_rs.AddChild( tbl10[x] );
        XML_data2.NodeValue := u.F_Order;
    end;

    Inc( x );

    if True = u.E_Left then begin
        XML_data2 			:= XML_rs.AddChild( tbl10[x] );
        XML_data2.NodeValue := u.F_Left;
    end;

    Inc( x );

    if True = u.E_Width then begin
        XML_data2 			:= XML_rs.AddChild( tbl10[x] );
        XML_data2.NodeValue := u.F_Width;
    end;

    Inc( x );

    if True = u.E_Top then begin
        XML_data2 			:= XML_rs.AddChild( tbl10[x] );
        XML_data2.NodeValue := u.F_Top;
    end;

    Inc( x );

    if True = u.E_Height then begin
        XML_data2 			:= XML_rs.AddChild( tbl10[x] );
        XML_data2.NodeValue := u.F_Height;
    end;

    Inc( x );

    if True = u.E_SystemModeBitMask then begin
        XML_data2 			:= XML_rs.AddChild( tbl10[x] );
        XML_data2.NodeValue := u.F_SystemModeBitMask;
    end;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
const
    tbl11 : array [0..7] of string = (
        'F_Id',
        'F_FrameId',
        'F_SrcPortNo',
        'F_Order',
        'F_Left',
        'F_Width',
        'F_Top',
        'F_Height'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function TScreenList.UiColorSrcKeyButtonLoad( cnl : IXMLNodeList ) : TUiColorSrcKeyButton;
var
    j : integer;
    str, txt : string;
    u : TUiColorSrcKeyButton;

begin

    u := TUiColorSrcKeyButton.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl11 ) of
        0:
            begin
                u.F_Id    := StrToIntDef( txt, -1 );
                u.E_Id    := True;
            end;

        1:
            begin
                u.F_FrameId            := txt;
                u.E_FrameId            := True;
            end;

        2:
            begin
                u.F_SrcPortNo            := txt;
                u.E_SrcPortNo            := True;
            end;

        3:
            begin
                u.F_Order        := txt;
                u.E_Order        := True;
            end;

        4:
            begin
                u.F_Left        := txt;
                u.E_Left        := True;
            end;

        5:
            begin
                u.F_Width        := txt;
                u.E_Width        := True;
            end;

        6:
            begin
                u.F_Top        := txt;
                u.E_Top        := True;
            end;

        7:
            begin
                u.F_Height        := txt;
                u.E_Height        := True;
            end;

        else
            _beep;

        end;
    end;

    Result := u;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TScreenList.UiColorSrcKeyButtonSave( XML_Doc : IXMLDocument; u : TUiColorSrcKeyButton );
var
	XML_rs    	: IXMLNode;
	XML_data2   : IXMLNode;
    x : integer;

begin

    XML_rs := XML_Doc.DocumentElement.AddChild( 'UiColorSrcKeyButton' );

    x := 0;

    if True = u.E_Id then begin
        XML_data2 			:= XML_rs.AddChild( tbl11[x] );
        XML_data2.NodeValue := u.F_Id;
    end;

    Inc( x );

    if True = u.E_FrameId then begin
        XML_data2 			:= XML_rs.AddChild( tbl11[x] );
        XML_data2.NodeValue := u.F_FrameId;
    end;

    Inc( x );

    if True = u.E_SrcPortNo then begin
        XML_data2 			:= XML_rs.AddChild( tbl11[x] );
        XML_data2.NodeValue := u.F_SrcPortNo;
    end;

    Inc( x );

    if True = u.E_Order then begin
        XML_data2 			:= XML_rs.AddChild( tbl11[x] );
        XML_data2.NodeValue := u.F_Order;
    end;

    Inc( x );

    if True = u.E_Left then begin
        XML_data2 			:= XML_rs.AddChild( tbl11[x] );
        XML_data2.NodeValue := u.F_Left;
    end;

    Inc( x );

    if True = u.E_Width then begin
        XML_data2 			:= XML_rs.AddChild( tbl11[x] );
        XML_data2.NodeValue := u.F_Width;
    end;

    Inc( x );

    if True = u.E_Top then begin
        XML_data2 			:= XML_rs.AddChild( tbl11[x] );
        XML_data2.NodeValue := u.F_Top;
    end;

    Inc( x );

    if True = u.E_Height then begin
        XML_data2 			:= XML_rs.AddChild( tbl11[x] );
        XML_data2.NodeValue := u.F_Height;
    end;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TDisplayDb.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TDisplayDb.Destroy;
begin
    inherited;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TDisplayList.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TDisplayList.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TDisplayList.GetData( index : integer ) : TDisplayDb;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TDisplayDb( Items[ index ] );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TDisplayList.ClearAll;
var
    dt : TDisplayDb;

begin
    while True do begin
        dt := Data[0];
        if nil = dt then break;

        Extract( dt );
        dt.Free;
    end;

end;

const
    FDisplayDbTable : array [0..3] of string = (
        'Message',
        'EnumType',
        'EnumValue',
        'DspSettings'
    );

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TDisplayList.Load( fn : string ) : Boolean;
var
    xml : IXMLDocument;
   	cnl, cnl0 : IXMLNodeList;
    j, n : integer;
	a : string;
    s : TDisplayDb;

begin
    Result := False;

    // ファイルなし
    if False = FileExists( fn ) then Exit;

    // XML読み込み
    xml	:= LoadXMLDocument( fn );

    // 'ScreenDb'
    cnl0	:= xml.DocumentElement.ChildNodes;

    for j:=0 to cnl0.Count-1 do begin

        a    := cnl0.Nodes[j].NodeName;

        n := AnsiIndexStr( a, FDisplayDbTable );
        if n = -1 then begin
            _beep;
            continue;
        end;

//        Inc( count[ n ] );

        cnl		:= cnl0.Nodes[j].ChildNodes;

        case n of
        0:  s := DisplayMessageLoad( cnl );
        1:  s := DisplayEmptyTypeLoad( cnl );
        2:  s := DisplayDisplayEmptyValueLoad( cnl );
        3:  s := DisplayDspSettingsLoad( cnl );
        else
            s := nil;
        end;

        if s <> nil then begin
            Add( s );
        end;

    end;

{
    m := 0;
    for j:=0 to HIGH( count ) do begin
        m := m + count[j];
    end;
}

    Result := False;
end;

//------------------------------------------------------------------------------
//  XMLファイル書き込み
//------------------------------------------------------------------------------
procedure TDisplayList.Save( fn : string );
var
	XML_Doc     : IXMLDocument;
    s : TDisplayDb;
    i : integer;

begin

	// XML書き込み処理
    XML_Doc 			:= TXMLDocument.Create(nil);

	// 出力時にインデント
    XML_Doc.Options 	:= [doNodeAutoIndent];
{   doNodeAutoCreate,
    doNodeAutoIndent,
    doAttrNull,
    doAutoPrefix,
    doNamespaceDecl,
    doAutoSave
}
	XML_Doc.Active  	:= True;
//    XML_Doc.Encoding	:= 'UTF-8';
    XML_Doc.Version		:= '1.0';
    XML_Doc.StandAlone  := 'yes';

    // ルート
    XML_Doc.AddChild( 'DisplayDb' );

    for i:=0 to Count-1 do begin

        s := Data[i];

        case s.FDataType of
        0:  DisplayMessageSave( XML_Doc, TDisplayMessage( s ) );
        1:  DisplayEnumTypeSave( XML_Doc, TDisplayEnumType( s ) );
        2:  DisplayEnumValueSave( XML_Doc, TDisplayEnumValue( s ) );
        3:  DisplayDspSettingsSave( XML_Doc, TDisplayDspSettings( s ) );
        end;

    end;

    // 保存
	try
    	if fn <> '' then	XML_Doc.SaveToFile( fn );
    except
		;
    end;

end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function TDisplayList.Search( dType : integer; id : string ) : TDisplayDb;
var
    d : TDisplayDb;
    i : integer;
    str : string;

begin

    for i:=0 to Count-1 do begin

        d := TDisplayDb( Data[i] );

        if d.FDataType <> dType then continue;

        case d.FDataType of
        TDisplayDb.typeMessage:
            begin
                if id = TDisplayMessage( d ).F_Id then begin
                    Result := d;
                    Exit;
                end;
            end;

        TDisplayDb.typeEnumType:
            begin
                if id = TDisplayEnumType( d ).F_Name then begin
                    Result := d;
                    Exit;
                end;
            end;

        TDisplayDb.typeEnumValue:
            begin
                str := TDisplayEnumValue( d ).F_EnumName + ' ' + TDisplayEnumValue( d ).F_Value;
                if id = str then begin
                    Result := d;
                    Exit;
                end;
            end;

        TDisplayDb.typeSetting:
            begin
                if id = TDisplayDspSettings( d ).F_ValueId then begin
                    Result := d;
                    Exit;
                end;
            end;

        end;
    end;

    Result := nil;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
const
    tbl_0 : array [0..3] of string = (
        'F_Id',
        'F_MessageCode',
        'F_Message',
        'F_Memo'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function TDisplayList.DisplayMessageLoad( cnl : IXMLNodeList ) : TDisplayMessage;
var
    j : integer;
    str, txt : string;
    u : TDisplayMessage;

begin

    u := TDisplayMessage.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl_0 ) of
        0:
            begin
                u.F_Id          := txt;
                u.E_Id          := True;
            end;

        1:
            begin
                u.F_MessageCode := txt;
                u.E_MessageCode := True;
            end;

        2:
            begin
                u.F_Message     := txt;
                u.E_Message     := True;
            end;

        3:
            begin
                u.F_Memo     := txt;
                u.E_Memo     := True;
            end;

        else
            begin
                _beep;
            end;
        end;
    end;

    Result := u;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TDisplayList.DisplayMessageSave( XML_Doc : IXMLDocument; u : TDisplayMessage );
var
	XML_rs    	: IXMLNode;
	XML_data2   : IXMLNode;
    x : integer;

begin

    XML_rs := XML_Doc.DocumentElement.AddChild( 'Message' );

    x := 0;

    if True = u.E_Id then begin
        XML_data2 			:= XML_rs.AddChild( tbl_0[x] );
        XML_data2.NodeValue := u.F_Id;
    end;

    Inc( x );

    if True = u.E_MessageCode then begin
        XML_data2 			:= XML_rs.AddChild( tbl_0[x] );
        XML_data2.NodeValue := u.F_MessageCode;
    end;

    Inc( x );

    if True = u.E_Message then begin
        XML_data2 			:= XML_rs.AddChild( tbl_0[x] );
        XML_data2.NodeValue := u.F_Message;
    end;

    Inc( x );

    if True = u.E_Memo then begin
        XML_data2 			:= XML_rs.AddChild( tbl_0[x] );
        XML_data2.NodeValue := u.F_Memo;
    end;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
const
    tbl_1 : array [0..1] of string = (
        'F_Name',
        'F_Note'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function TDisplayList.DisplayEmptyTypeLoad( cnl : IXMLNodeList ) : TDisplayEnumType;
var
    j : integer;
    str, txt : string;
    u : TDisplayEnumType;

begin

    u := TDisplayEnumType.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl_1 ) of
        0:
            begin
                u.F_Name    := txt;
                u.E_Name    := True;
            end;

        1:
            begin
                u.F_Note    := txt;
                u.E_Note    := True;
            end;

        else
            begin
                _beep;
            end;

        end;
    end;

    Result := u;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TDisplayList.DisplayEnumTypeSave( XML_Doc : IXMLDocument; u : TDisplayEnumType );
var
	XML_rs    	: IXMLNode;
	XML_data2   : IXMLNode;
    x : integer;

begin

    XML_rs := XML_Doc.DocumentElement.AddChild( 'EnumType' );

    x := 0;

    if True = u.E_Name then begin
        XML_data2 			:= XML_rs.AddChild( tbl_1[x] );
        XML_data2.NodeValue := u.F_Name;
    end;

    Inc( x );

    if True = u.E_Note then begin
        XML_data2 			:= XML_rs.AddChild( tbl_1[x] );
        XML_data2.NodeValue := u.F_Note;
    end;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
const
    tbl_2 : array [0..6] of string = (
        'F_EnumName',
        'F_Value',
        'F_Order',
        'F_Text',
        'F_Tag',
        'F_Arrtibute',
        'F_IsHidden'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function TDisplayList.DisplayDisplayEmptyValueLoad( cnl : IXMLNodeList ) : TDisplayEnumvalue;
var
    j : integer;
    str, txt : string;
    u : TDisplayEnumValue;

begin

    u := TDisplayEnumValue.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl_2 ) of
        0:
            begin
                u.F_EnumName    := txt;
                u.E_EnumName    := True;
            end;

        1:
            begin
                u.F_Value       := txt;
                u.E_Value       := True;
            end;

        2:
            begin
                u.F_Order       := txt;
                u.E_Order       := True;
            end;

        3:
            begin
                u.F_Text        := txt;
                u.E_Text        := True;
            end;

        4:
            begin
                u.F_Tag         := txt;
                u.E_Tag         := True;
            end;

        5:
            begin
                u.F_Arrtibute   := txt;
                u.E_Arrtibute   := True;
            end;

        6:
            begin
                u.F_IsHidden    := txt;
                u.E_IsHidden    := True;
            end;

        else
            begin
                _beep;
            end;
        end;
    end;

    Result := u;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TDisplayList.DisplayEnumValueSave( XML_Doc : IXMLDocument; u : TDisplayEnumValue );
var
	XML_rs    	: IXMLNode;
	XML_data2   : IXMLNode;
    x : integer;

begin

    XML_rs := XML_Doc.DocumentElement.AddChild( 'EnumValue' );

    x := 0;

    if True = u.E_EnumName then begin
        XML_data2 			:= XML_rs.AddChild( tbl_2[x] );
        XML_data2.NodeValue := u.F_EnumName;
    end;

    Inc( x );

    if True = u.E_Value then begin
        XML_data2 			:= XML_rs.AddChild( tbl_2[x] );
        XML_data2.NodeValue := u.F_Value;
    end;
    Inc( x );

    if True = u.E_Order then begin
        XML_data2 			:= XML_rs.AddChild( tbl_2[x] );
        XML_data2.NodeValue := u.F_Order;
    end;

    Inc( x );

    if True = u.E_Text then begin
        XML_data2 			:= XML_rs.AddChild( tbl_2[x] );
        XML_data2.NodeValue := u.F_Text;
    end;

    Inc( x );

    if True = u.E_Tag then begin
        XML_data2 			:= XML_rs.AddChild( tbl_2[x] );
        XML_data2.NodeValue := u.F_Tag;
    end;

    Inc( x );

    if True = u.E_Arrtibute then begin
        XML_data2 			:= XML_rs.AddChild( tbl_2[x] );
        XML_data2.NodeValue := u.F_Arrtibute;
    end;

    Inc( x );

    if True = u.E_IsHidden then begin
        XML_data2 			:= XML_rs.AddChild( tbl_2[x] );
        XML_data2.NodeValue := u.F_IsHidden;
    end;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
const
    tbl_3 : array [0..3] of string = (
        'F_ValueId',
        'F_Value',
        'F_Order',
        'F_Note'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function TDisplayList.DisplayDspSettingsLoad( cnl : IXMLNodeList ) : TDisplayDspSettings;
var
    j : integer;
    str, txt : string;
    u : TDisplayDspSettings;

begin

    u := TDisplayDspSettings.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl_3 ) of
        0:
            begin
                u.F_ValueId := txt;
                u.E_ValueId := True;
            end;

        1:
            begin
                u.F_Value   := txt;
                u.E_Value   := True;
            end;

        2:
            begin
                u.F_Order   := txt;
                u.E_Order   := True;
            end;

        3:
            begin
                u.F_Note    := txt;
                u.E_Note    := True;
            end;

        else
            begin
                _beep;
            end;

        end;
    end;

    Result := u;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TDisplayList.DisplayDspSettingsSave( XML_Doc : IXMLDocument; u : TDisplayDspSettings );
var
	XML_rs    	: IXMLNode;
	XML_data2   : IXMLNode;
    x : integer;

begin

    XML_rs := XML_Doc.DocumentElement.AddChild( 'DspSettings' );

    x := 0;

    if True = u.E_ValueId then begin
        XML_data2 			:= XML_rs.AddChild( tbl_3[x] );
        XML_data2.NodeValue := u.F_ValueId;
    end;

    Inc( x );

    if True = u.E_Value then begin
        XML_data2 			:= XML_rs.AddChild( tbl_3[x] );
        XML_data2.NodeValue := u.F_Value;
    end;

    Inc( x );

    if True = u.E_Order then begin
        XML_data2 			:= XML_rs.AddChild( tbl_3[x] );
        XML_data2.NodeValue := u.F_Order;
    end;

    Inc( x );

    if True = u.E_Note then begin
        XML_data2 			:= XML_rs.AddChild( tbl_3[x] );
        XML_data2.NodeValue := u.F_Note;
    end;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TDisplayMessage.Create;
begin
    inherited;

    FDataType       := typeMessage;

    F_Id            := '';
    E_Id            := False;

    F_MessageCode   := '';
    E_MessageCode   := False;

    F_Message       := '';
    E_Message       := False;

    F_Memo          := '';
    E_Memo          := False;
end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TDisplayMessage.Destroy;
begin
    inherited;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TDisplayEnumType.Create;
begin
    inherited;

    FDataType   := typeEnumType;

    F_Name      := '';
    E_Name      := False;

    F_Note      := '';
    E_Note      := False;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TDisplayEnumType.Destroy;
begin
    inherited;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TDisplayEnumvalue.Create;
begin
    inherited;

    FDataType   := typeEnumValue;

    F_EnumName  := '';
    E_EnumName  := False;

    F_Value     := '';
    E_Value     := False;

    F_Order     := '';
    E_Order     := False;

    F_Text      := '';
    E_Text      := False;

    F_Arrtibute := '';
    E_Arrtibute := False;

    F_Tag       := '';
    E_Tag       := False;
end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TDisplayEnumvalue.Destroy;
begin
    inherited;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TDisplayDspSettings.Create;
begin
    inherited;

    FDataType   := typeSetting;

    F_ValueId   := '';
    E_ValueId   := False;

    F_Value     := '';
    E_Value     := False;

    F_Order     := '';
    E_Order     := False;

    F_Note      := '';
    E_Note      := False;
end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TDisplayDspSettings.Destroy;
begin
    inherited;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TProgramDb.Create;
begin
    inherited;

    FSourceList         := TXPTSourceList.Create;
    FDeviceList         := TPgDeviceList.Create;
    FDestList           := TPgDestinationList.Create;
    FCrosspointList     := TPgCrossPointList.Create;

    FMultiViewList      := TPgMultiViewList.Create;
end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TProgramDb.Destroy;
begin
    inherited;

end;

const
    FProgramDbTable : array [0..8] of string = (
        'PgSettings',
        'PgXpt',
        'PgDevice',
        'PgBkupData',
        'PgDstName',
        'PgSrcName',
        'PgSrcKeyColor',
        'PgPanelKey',
        'PgMvDstButton'
    );

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TProgramDb.Load( fn : string ) : Boolean;
var
    xml : IXMLDocument;
   	cnl, cnl0 : IXMLNodeList;
    j, n : integer;
	a : string;
//    count : array [0..15] of integer;

begin
    Result := False;

    // ファイルなし
    if False = FileExists( fn ) then Exit;

    // XML読み込み
    xml	:= LoadXMLDocument( fn );

    // 'ProgramDb'
    cnl0	:= xml.DocumentElement.ChildNodes;

    for j:=0 to cnl0.Count-1 do begin

        a    := cnl0.Nodes[j].NodeName;

        n := AnsiIndexStr( a, FProgramDbTable );
        if n = -1 then begin
            _beep;
            continue;
        end;

//        Inc( count[ n ] );

        cnl		:= cnl0.Nodes[j].ChildNodes;

        case n of
        0:  ;                           // PgSettings
        1:  PgCrossPointLoad( cnl );    // PgXpt
        2:  PgDeviceLoad( cnl );        // PgDevice
        3:  ;                           // PgBkupData
        4:  PgDestinationLoad( cnl );   // PgDstName
        5:  XPTSourceLoad( cnl );       // PgSrcName
        6:  ;                           // PgSrcKeyColor
        7:  PgPanelKeyLoad( cnl );      // PgPanelKey
        8:  PgMvDstButtonLoad( cnl );   // PgMvDstButton;
        end;

    end;

{
    m := 0;
    for j:=0 to HIGH( count ) do begin
        m := m + count[j];
    end;
}
    Result := False;
end;


//------------------------------------------------------------------------------
//  PgDevice
//------------------------------------------------------------------------------
const
    tbl_11 : array [0..2] of string = (
        'F_DeviceId',
        'F_DeviceTypeName',
        'F_BkupDateTime'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TProgramDb.PgDeviceLoad( cnl : IXMLNodeList );
var
    j : integer;
    str, txt : string;
    u : TPgDeviceData;

begin

    u := TPgDeviceData.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl_11 ) of
        0:  u.DeviceId          := txt;
        1:  u.DeviceTypeName    := txt;
        2:  u.BkupDateTime      := txt;
        else
            begin
                _beep;
            end;
        end;
    end;

    FDeviceList.Add( u );
end;

//------------------------------------------------------------------------------
//  PgPanelKey
//------------------------------------------------------------------------------
const
    tbl_12 : array [0..5] of string = (
        'F_DeviceId',
        'F_PageNo',
        'F_KeyNo',
        'F_KeyType',
        'F_Value',
        'F_IsInhibit'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TProgramDb.PgPanelKeyLoad( cnl : IXMLNodeList );
var
    j : integer;
    str, txt : string;
    u : TPgPanelKey;
    dv : TPgDeviceData;

begin

    u := TPgPanelKey.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl_12 ) of
        0:  u.DeviceId  := txt;
        1:  u.PageNo    := StrToIntDef( txt, 0 );
        2:  u.KeyNo     := txt;
        3:  u.KeyType   := txt;
        4:  u.Value     := txt;
        5:  u.IsInhibit := txt;
        else
            begin
                _beep;
            end;
        end;
    end;

    try
        dv := FDeviceList.SearchDeviceID( u.DeviceId );
        if nil <> dv then begin
            if u.PageNo < TPgDeviceData.MAX_PAGE then
                dv.Page[ u.PageNo ].Add( u )
            else
                u.Free;
        end;

    except
        _beep;
    end;

end;

//------------------------------------------------------------------------------
//  PgMvDstButton
//------------------------------------------------------------------------------
const
    tbl_13 : array [0..8] of string = (
        'F_Id',
        'F_FrameId',
        'F_PresetNo',
        'F_DstPortNo',
        'F_Order',
        'F_Left',
        'F_Width',
        'F_Top',
        'F_Height'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TProgramDb.PgMvDstButtonLoad( cnl : IXMLNodeList );
var
    j : integer;
    str, txt : string;
    u : TPgMvDstButton;

begin

    u := TPgMvDstButton.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl_13 ) of
        0:  u.F_Id          := txt;
        1:  u.F_FrameId     := txt;
        2:  u.F_PresetNo    := txt;
        3:  u.F_DstPortNo   := txt;
        4:  u.F_Order       := txt;
        5:  u.F_Left        := txt;
        6:  u.F_Width       := txt;
        7:  u.F_Top         := txt;
        8:  u.F_Height      := txt;
        else
            begin
                _beep;
            end;

        end;

    end;

{
    try
        dv := FDeviceList.SearchDeviceID( u.DeviceId );
        if nil <> dv then begin
            if u.PageNo < TPgDeviceData.MAX_PAGE then
                dv.Page[ u.PageNo ].Add( u )
            else
                u.Free;
        end;

    except
        _beep;
    end;
}


    FMultiViewList.Add( u );

end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
const
    tbl_10 : array [0..24] of string = (
        'F_SrcPortNo',
        'F_DefaultDescription',
        'F_DefaultDescription4k',
        'F_Description',
        'F_Description4k',
        'F_InputName',
        'F_ClipDuration',
        'F_NameHeader',
        'F_NameFooter',
        'F_BusLinkId',
        'F_DescriptionLinkId',
        'F_DescriptionLinkId4k',
        'F_InputNameLinkId',
        'F_JMode',
        'F_JLength',
        'F_JDelimiter',
        'F_IsNameSendTarget',
        'F_DispMode',
        'F_DispModeName',
        'F_JMode2',
        'F_UseWideChar',
        'F_DefaultDescriptionQd',
        'F_DescriptionQd',
        'F_DefaultInputName',
        'F_IsInputNameNameHeaderLinked'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TProgramDb.XPTSourceLoad( cnl : IXMLNodeList );
var
    j : integer;
    str, txt : string;
    u : TXPTSourceData;

    n, ccn : IXMLNode;

begin

    u := TXPTSourceData.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        n := cnl.Nodes[j];
        if 0 <> n.Attributenodes.count then begin
            ccn := n.AttributeNodes[0];
            str := ccn.NodeName;
            txt	:= ccn.Text;
        end;

        case AnsiIndexStr( str, tbl_10 ) of
        0:  u.F_SrcPortNo               := txt;
        1:  u.F_DefaultDescription      := txt;
        2:  u.F_DefaultDescription4k    := txt;
        3:  u.F_Description             := txt;
        4:  u.F_Description4k           := txt;
        5:  u.F_InputName               := txt;
        6:  u.F_ClipDuration            := txt;
        7:  u.F_NameHeader              := txt;
        8:  u.F_NameFooter              := txt;
        9:  u.F_BusLinkId               := txt;
        10: u.F_DescriptionLinkId       := txt;
        11: u.F_DescriptionLinkId4k     := txt;
        12: u.F_InputNameLinkId         := txt;
        13: u.F_JMode                   := txt;
        14: u.F_JLength                 := txt;
        15: u.F_JDelimiter              := txt;
        16: u.F_IsNameSendTarget        := txt;
        17: u.F_DispMode                := txt;
        18: u.F_DispModeName            := txt;
        19: u.F_JMode2                  := txt;
        20: u.F_UseWideChar             := txt;
        21: u.F_DefaultDescriptionQd    := txt;
        22: u.F_DescriptionQd           := txt;
        23: u.F_DefaultInputName        := txt;
        24: u.F_IsInputNameNameHeaderLinked := txt;
        else
            begin
                _beep;
            end;
        end;
    end;

    FSourceList.Add( u );
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
const
    tbl_14 : array [0..17] of string = (
        'F_DstPortNo',
        'F_DefaultDescription',
        'F_DefaultDescription4k',
        'F_Description',
        'F_Description4k',
        'F_InputName',
        'F_DescriptionLinkId',
        'F_InputNameLinkId',
        'F_JMode',
        'F_JLength',
        'F_JDelimiter',
        'F_IsNameSendTarget',
        'F_JMode2',
        'F_UseWideChar',
        'F_DefaultDescriptionQd',
        'F_DescriptionQd',
        'F_DefaultInputName',
        'F_IsXptSendTarget'
    );

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TProgramDb.PgDestinationLoad( cnl : IXMLNodeList );
var
    j : integer;
    str, txt : string;
    u : TPgDestinationData;

begin
    u := TPgDestinationData.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl_14 ) of
        0:  u.F_DstPortNo               := txt;
        1:  u.F_DefaultDescription      := txt;
        2:  u.F_DefaultDescription4k    := txt;
        3:  u.F_Description             := txt;
        4:  u.F_Description4k           := txt;
        5:  u.F_InputName               := txt;
        6:  u.F_DescriptionLinkId       := txt;
        7:  u.F_InputNameLinkId         := txt;
        8:  u.F_JMode                   := txt;
        9:  u.F_JLength                 := txt;
        10: u.F_JDelimiter              := txt;
        11: u.F_IsNameSendTarget        := txt;
        12: u.F_JMode2                  := txt;
        13: u.F_UseWideChar             := txt;
        14: u.F_DefaultDescriptionQd    := txt;
        15: u.F_DescriptionQd           := txt;
        16: u.F_DefaultInputName        := txt;
        17: u.F_IsXptSendTarget         := txt;
        else
            begin
                _beep;
            end;
        end;
    end;

    FDestList.Add( u );
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
const
    tbl_15 : array [0..2] of string = (
        'F_DstPortNo',
        'F_Level',
        'F_SrcPortNo'
    );

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TProgramDb.PgCrossPointLoad( cnl : IXMLNodeList );
var
    j : integer;
    str, txt : string;
    u : TPgCrossPoint;

begin
    u := TPgCrossPoint.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl_15 ) of
        0:  u.F_DstPortNo               := txt;
        1:  u.F_Level                   := txt;
        2:  u.F_SrcPortNo               := txt;

        else
            _beep;

        end;
    end;

    FCrosspointList.Add( u );
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TXPTSourceData.Create;
begin
    inherited;

    F_SrcPortNo               := '';
    F_DefaultDescription      := '';
    F_DefaultDescription4k    := '';
    F_Description             := '';
    F_Description4k           := '';
    F_InputName               := '';
    F_ClipDuration            := '';
    F_NameHeader              := '';
    F_NameFooter              := '';
    F_BusLinkId               := '';
    F_DescriptionLinkId       := '';
    F_DescriptionLinkId4k     := '';
    F_InputNameLinkId         := '';
    F_JMode                   := '';
    F_JLength                 := '';
    F_JDelimiter              := '';
    F_IsNameSendTarget        := '';
    F_DispMode                := '';
    F_DispModeName            := '';
    F_JMode2                  := '';
    F_UseWideChar             := '';
    F_DefaultDescriptionQd    := '';
    F_DescriptionQd           := '';
    F_DefaultInputName        := '';
    F_IsInputNameNameHeaderLinked   := '';

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor 	TXPTSourceData.Destroy;
begin
    inherited;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TProgramDbList.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TProgramDbList.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TProgramDbList.ClearAll;
begin

    ;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TXPTSourceList.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TXPTSourceList.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TXPTSourceList.GetData( index : integer ) : TXPTSourceData;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TXPTSourceData( Items[ index ] );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TXPTSourceList.ClearAll;
var
    dt : TXPTSourceData;

begin
    while True do begin
        dt := Data[0];
        if dt = nil then break;

        Extract( dt );
        dt.Free;
    end;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TXPTSourceList.Search( port : integer ) : string;
var
    i : integer;
    dt : TXPTSourceData;
    portstr : string;

begin
    portstr := IntToStr( port );

    for i:=0 to Count-1 do begin
        dt := Data[i];
//        if dt.Port = port then begin
        if dt.F_SrcPortNo = portstr then begin
            Result := dt.F_DefaultDescription;  //.Name;
            Exit;
        end;
    end;

    Result := '';
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TPgDeviceData.Create;
var
    i : integer;

begin
    inherited;

    FDeviceId       := '';
    FDeviceTypeName := '';
    FBkupDateTime   := '';

    for i:=0 to HIGH( FPage ) do
        FPage[i]    := TPgPanelKeyList.Create;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor 	TPgDeviceData.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TPgDeviceData.GetPage( index : integer ) : TPgPanelKeyList;
begin
    Result := FPage[ index ];
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TPgMvDstButton.Create;
begin
    inherited;

    F_Id        := '';
    F_FrameId   := '';
    F_PresetNo  := '';
    F_DstPortNo := '';
    F_Order     := '';
    F_Left      := '';
    F_Width     := '';
    F_Top       := '';
    F_Height    := '';
end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor 	TPgMvDstButton.Destroy;
begin
    inherited;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TPgDeviceList.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TPgDeviceList.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TPgDeviceList.GetData( index : integer ) : TPgDeviceData;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TPgDeviceData( Items[ index ] );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TPgDeviceList.SearchDeviceID( id : string ) : TPgDeviceData;
var
    i : integer;
    d : TPgDeviceData;

begin
    for i:=0 to Count-1 do begin
        d := Data[i];
        if d.DeviceId = id then begin
            Result := d;
            Exit;
        end;
    end;

    Result := nil;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TPgDestinationData.Create;
begin
    inherited;

    F_DstPortNo               := '';
    F_DefaultDescription      := '';
    F_DefaultDescription4k    := '';
    F_Description             := '';
    F_Description4k           := '';
    F_InputName               := '';
    F_DescriptionLinkId       := '';
    F_InputNameLinkId         := '';
    F_JMode                   := '';
    F_JLength                 := '';
    F_JDelimiter              := '';
    F_IsNameSendTarget        := '';
    F_JMode2                  := '';
    F_UseWideChar             := '';
    F_DefaultDescriptionQd    := '';
    F_DescriptionQd           := '';
    F_DefaultInputName        := '';
    F_IsXptSendTarget         := '';

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TPgDestinationData.Destroy;
begin
    inherited;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TPgDestinationList.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TPgDestinationList.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TPgDestinationList.GetData( index : integer ) : TPgDestinationData;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TPgDestinationData( Items[ index ] );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TPgDestinationList.Search( port : string ) : string;
var
    i : integer;
    dt : TPgDestinationData;

begin
    for i:=0 to Count-1 do begin
        dt := Data[i];
        if dt.F_DstPortNo = port then begin
            Result := dt.F_DefaultDescription;
            Exit;
        end;
    end;

    Result := '';
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TPgPanelKey.Create;
begin
    inherited;

    FDeviceId       := '';
    FPageNo         := 0;

    FKeyNo          := '';
    FKeyType        := '';
    FValue          := '';
    FIsInhibit      := '';
end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TPgPanelKey.Destroy;
begin
    inherited;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TPgPanelKeyList.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TPgPanelKeyList.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TPgPanelKeyList.GetData( index : integer ) : TPgPanelKey;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TPgPanelKey( Items[ index ] );
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TPgCrossPoint.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TPgCrossPoint.Destroy;
begin
    inherited;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TPgCrossPointList.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TPgCrossPointList.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TPgCrossPointList.GetData( index : integer ) : TPgCrossPoint;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TPgCrossPoint( Items[ index ] );
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TPgMultiViewList.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TPgMultiViewList.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TPgMultiViewList.GetData( index : integer ) : TPgMvDstButton;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TPgMvDstButton( Items[ index ] );
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSBusDb.Create;
begin
    inherited;

    FSbDeviceList               := TSbDeviceList.Create;
    FSbPanelTypeList            := TSbPanelTypeList.Create;
    FSbDeviceTypeList           := TSbDeviceTypeList.Create;
    FSbXptBusList               := TSbXptBusList.Create;
    FSbSrcNameBusList           := TSbSrcNameBusList.Create;
    FSbDstNameBusList           := TSbDstNameBusList.Create;
    FSbSrcNameGroupList         := TSbSrcNameGroupList.Create;
    FSbDstNameGroupList         := TSbDstNameGroupList.Create;
    FSbPanelFunctionKeyDefineList   := TSbPanelFunctionKeyDefineList.Create;
    FSbPanelFunctionKeyMappingList  := TSbPanelFunctionKeyMappingList.Create;;
    FSbSettingsList             := TSbSettingsList.Create;
    FSbDstInhibitList           := TSbDstInhibitList.Create;
    FSbAlarmDefineList          := TSbAlarmDefineList.Create;
    FSbPanelPageNameList        := TSbPanelPageNameList.Create;
    FSbDevicePanelPageNameList  := TSbDevicePanelPageNameList.Create;
    FSbSrcColorList             := TSbSrcColorList.Create;
    FSbDstControlTargetList     := TSbDstControlTargetList.Create;
    FSbEditSrcSetGroupList      := TSbEditSrcSetGroupList.Create;
    FSbEditDstSetGroupList      := TSbEditDstSetGroupList.Create;
    FSbEditSrcLevelDefineList   := TSbEditSrcLevelDefineList.Create;
    FSbEditDstLevelDefineList   := TSbEditDstLevelDefineList.Create;
    FSbSystemModeList           := TSbSystemModeList.Create;
    FSbMultiLevelDstList        := TSbMultiLevelDstList.Create;
    FSbMultiLevelSrcList        := TSbMultiLevelSrcList.Create;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSBusDb.Destroy;
begin

    FSbDeviceList.ClearAll;
    FSbDeviceList.Free;

    FSbPanelTypeList.ClearAll;
    FSbPanelTypeList.Free;

    FSbDeviceTypeList.ClearAll;
    FSbDeviceTypeList.Free;

    FSbXptBusList.ClearAll;
    FSbXptBusList.Free;

    FSbSrcNameBusList.ClearAll;
    FSbSrcNameBusList.Free;

    FSbDstNameBusList.ClearAll;
    FSbDstNameBusList.Free;

    FSbSrcNameGroupList.ClearAll;
    FSbSrcNameGroupList.Free;

    FSbDstNameGroupList.ClearAll;
    FSbDstNameGroupList.Free;

    FSbDstInhibitList.ClearAll;
    FSbDstInhibitList.Free;

    FSbAlarmDefineList.ClearAll;
    FSbAlarmDefineList.Free;

    FSbPanelPageNameList.ClearAll;
    FSbPanelPageNameList.Free;

    FSbSettingsList.ClearAll;
    FSbSettingsList.Free;

    FSbPanelFunctionKeyDefineList.ClearAll;
    FSbPanelFunctionKeyDefineList.Free;

    FSbPanelFunctionKeyMappingList.ClearAll;
    FSbPanelFunctionKeyMappingList.Free;

    FSbDevicePanelPageNameList.ClearAll;
    FSbDevicePanelPageNameList.Free;

    FSbSrcColorList.ClearAll;
    FSbSrcColorList.Free;

    FSbDstControlTargetList.ClearAll;
    FSbDstControlTargetList.Free;

    FSbEditSrcSetGroupList.ClearAll;
    FSbEditSrcSetGroupList.Free;

    FSbEditDstSetGroupList.ClearAll;
    FSbEditDstSetGroupList.Free;

    FSbEditSrcLevelDefineList.ClearAll;
    FSbEditSrcLevelDefineList.Free;

    FSbEditDstLevelDefineList.ClearAll;
    FSbEditDstLevelDefineList.Free;

    FSbSystemModeList.ClearAll;
    FSbSystemModeList.Free;

    FSbMultiLevelDstList.ClearAll;
    FSbMultiLevelDstList.Free;

    FSbMultiLevelSrcList.ClearAll;
    FSbMultiLevelSrcList.Free;

    inherited;

end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
constructor TXptRange.Create( min, max : integer );
begin
//    inherited;

    FMax    := max;
    FMin    := min;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
destructor TXptRange.Destroy;
begin
    inherited;
end;

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TXptRangeList.Create;
begin
    inherited;

end;


//-----------------------------------------------------------------------------
// デストラクタ
//-----------------------------------------------------------------------------
destructor TXptRangeList.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TXptRangeList.GetData( index : integer ) : TXptRange;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TXptRange( Items[ index ] );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TXptRangeList.ClearAll;
var
    dt : TXptRange;

begin
    while True do begin
        dt := Data[0];
        if nil = dt then break;

        Extract( dt );
        dt.Free;
    end;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TXptRangeList.InRange( port : integer ) : Boolean;
var
    d : TXptRange;
    i : integer;

begin
    for i:=0 to Count-1 do begin

        d := Data[i];
        if (d.FMin <= port) and (port <= d.FMax) then begin
            Result := True;
            Exit;
        end;
    end;

    Result := False;
end;


//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
const
    FSBusDbTable : array [0..23] of string = (
        'SbDevice',
        'SbPanelType',
        'SbDeviceType',
        'SbXptBus',
        'SbSrcNameBus',
        'SbSrcNameGroup',
        'SbDstNameBus',
        'SbPanelFunctionKeyDefine',
        'SbPanelFunctionKeyMapping',
        'SbSettings',
        'SbDstInhibit',
        'SbAlarmDefine',
        'SbPanelPageName',
        'SbDevicePanelPageName',
        'SbSrcColor',
        'SbDstControlTarget',
        'SbDstNameGroup',
        'SbEditSrcSetGroup',
        'SbEditDstSetGroup',
        'SbEditSrcLevelDefine',
        'SbEditDstLevelDefine',
        'SbSystemMode',
        'SbMultiLevelDst',
        'SbMultiLevelSrc'
    );

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TSBusDb.Load( fn : string ) : Boolean;
var
    xml : IXMLDocument;
   	cnl, cnl0 : IXMLNodeList;
    j, n : integer;
	a : string;

begin
    Result := False;

    // ファイルなし
    if False = FileExists( fn ) then Exit;

    // XML読み込み
    xml	:= LoadXMLDocument( fn );

    // 'ProgramDb'
    cnl0	:= xml.DocumentElement.ChildNodes;

    for j:=0 to cnl0.Count-1 do begin

        a   := cnl0.Nodes[j].NodeName;
        n   := AnsiIndexStr( a, FSBusDbTable );
        cnl	:= cnl0.Nodes[j].ChildNodes;

        case n of
        0:  SbDeviceLoad( cnl );
        1:  SbPanelTypeLoad( cnl );
        2:  SbDeviceTypeLoad( cnl );
        3:  SbXptBusLoad( cnl );
        4:  SbSrcNameBusLoad( cnl );
        5:  SbSrcNameGroupLoad( cnl );
        6:  SbDstNameBusLoad( cnl );
        7:  SbPanelFunctionKeyDefineLoad( cnl );
        8:  SbPanelFunctionKeyMappingLoad( cnl );
        9:  SbSettingsLoad( cnl );
        10: SbDstInhibitLoad( cnl );
        11: SbAlarmDefineLoad( cnl );
        12: SbPanelPageNameLoad( cnl );
        13: SbDevicePanelPageNameLoad( cnl );
        14: SbSrcColorLoad( cnl );
        15: SbDstControlTargetLoad( cnl );
        16: SbDstNameGroupLoad( cnl );
        17: SbEditSrcSetGroupLoad( cnl );
        18: SbEditDstSetGroupLoad( cnl );
        19: SbEditSrcLevelDefineLoad( cnl );
        20: SbEditDstLevelDefineLoad( cnl );
        21: SbSystemModeLoad( cnl );
        22: SbMultiLevelDstLoad( cnl );
        23: SbMultiLevelSrcLoad( cnl );
        else
            _beep;
        end;

    end;

{
    m := 0;
    for j:=0 to HIGH( count ) do begin
        m := m + count[j];
    end;
}
    Result := False;
end;

//------------------------------------------------------------------------------
//  XMLファイル書き込み
//------------------------------------------------------------------------------
procedure TSBusDb.Save( fn : string );
var
	XML_Doc     : IXMLDocument;

begin

	// XML書き込み処理
    XML_Doc 			:= TXMLDocument.Create(nil);

	// 出力時にインデント
    XML_Doc.Options 	:= [doNodeAutoIndent];
	XML_Doc.Active  	:= True;
//    XML_Doc.Encoding	:= 'UTF-8';
//    XML_Doc.Version		:= '1.0';
    XML_Doc.Version		:= '1.0';
    XML_Doc.StandAlone  := 'yes';

    // ルート
    XML_Doc.AddChild( 'SbusDb' );

    SbDeviceSave( XML_Doc );
    SbPanelTypeSave( XML_Doc );
    SbDeviceTypeSave( XML_Doc );
    SbXptBusSave( XML_Doc );
    SbSrcNameBusSave( XML_Doc );
    SbSrcNameGroupSave( XML_Doc );
    SbDstNameBusSave( XML_Doc );
    SbPanelFunctionKeyDefineSave( XML_Doc );
    SbPanelFunctionKeyMappingSave( XML_Doc );
    SbSettingsSave( XML_Doc );
    SbDstInhibitSave( XML_Doc );
    SbAlarmDefineSave( XML_Doc );
    SbPanelPageNameSave( XML_Doc );
    SbDevicePanelPageNameSave( XML_Doc );
    SbSrcColorSave( XML_Doc );
    SbDstControlTargetsave( XML_Doc );
    SbDstNameGroupSave( XML_Doc );
    SbEditSrcSetGroupSave( XML_Doc );
    SbEditDstSetGroupSave( XML_Doc );
    SbEditSrcLevelDefineSave( XML_Doc );
    SbEditDstLevelDefineSave( XML_Doc );
    SbSystemModeSave( XML_Doc );
    SbMultiLevelDstSave( XML_Doc );
    SbMultiLevelSrcSave( XML_Doc );

    // 保存
	try
    	if fn <> '' then	XML_Doc.SaveToFile( fn );
    except
		;
    end;

end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
const
    tbl_20  : array [0..16] of string = (
        'F_Id',
        'F_ParentStationId',
        'F_StationId',
        'F_TypeName',
        'F_Name',
        'F_IpAddress',
        'F_TimeoutMsec',
        'F_IsSendTarget',
        'F_IsRecvTarget',
        'F_IsKeyAssign',
        'F_KeyAssignPageCount',
        'F_Attribute',
        'F_IsEditLocked',
        'F_DeviceCategoryName',
        'F_IsNsbusDevice',
        'F_Is4kHdChangeSendTarget',
        'F_SentSystemMode'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function TSBusDb.SbDeviceLoad( cnl : IXMLNodeList ) : TSbDevice;
var
    j : integer;
    str, txt : string;
    u : TSbDevice;

begin

    u := TSbDevice.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;



{
    property AttributeNodes: IXMLNodeList read GetAttributeNodes;
    property ChildNodes: IXMLNodeList read GetChildNodes;
    property ChildValues[const IndexOrName: OleVariant]: OleVariant read GetChildValue write SetChildValue; default;
    property Collection: IXMLNodeCollection read GetCollection;
    property DOMNode: IDOMNode read GetDOMNode;
    property OwnerDocument: IXMLDocument read GetOwnerDocument;
    property HasChildNodes: Boolean read GetHasChildNodes;
    property IsTextElement: Boolean read GetIsTextElement;
    property LocalName: DOMString read GetLocalName;
    property NamespaceURI: DOMString read GetNameSpaceURI;
    property NodeName: DOMstring read GetNodeName;
    property NodeType: TNodeType read GetNodeType;
    property NodeValue: OleVariant read GetNodeValue write SetNodeValue;
    property ParentNode: IXMLNode read GetParentNode;
    property Prefix: DOMString read GetPrefix;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly;
    property Text: DOMString read GetText write SetText;
    property XML: DOMString read GetXML;

}



        case AnsiIndexStr( str, tbl_20 ) of
        0:  begin   u.F_Id                  := txt;     u.E_Id                  := True;    end;
        1:  begin   u.F_ParentStationId     := txt;     u.E_ParentStationId     := True;    end;
        2:  begin   u.F_StationId           := txt;     u.E_StationId           := True;    end;
        3:  begin   u.F_TypeName            := txt;     u.E_TypeName            := True;    end;
        4:  begin   u.F_Name                := txt;     u.E_Name                := True;    end;
        5:  begin   u.F_IpAddress           := txt;     u.E_IpAddress           := True;    end;
        6:  begin   u.F_TimeoutMsec         := txt;     u.E_TimeoutMsec         := True;    end;
        7:  begin   u.F_IsSendTarget        := txt;     u.E_IsSendTarget        := True;    end;
        8:  begin   u.F_IsRecvTarget        := txt;     u.E_IsRecvTarget        := True;    end;
        9:  begin   u.F_IsKeyAssign         := txt;     u.E_IsKeyAssign         := True;    end;
        10: begin   u.F_KeyAssignPageCount  := txt;     u.E_KeyAssignPageCount  := True;    end;
        11: begin   u.F_Attribute           := txt;     u.E_Attribute           := True;    end;
        12: begin   u.F_IsEditLocked        := txt;     u.E_IsEditLocked        := True;    end;
        13: begin   u.F_DeviceCategoryName  := txt;     u.E_DeviceCategoryName  := True;    end;
        14: begin   u.F_IsNsbusDevice       := txt;     u.E_IsNsbusDevice       := True;    end;
        15: begin   u.F_Is4kHdChangeSendTarget:= txt;   u.E_Is4kHdChangeSendTarget:= True;    end;
        16: begin   u.F_SentSystemMode      := txt;     u.E_SentSystemMode        := True;    end;
        else
            begin
                _beep;
            end;
        end;
    end;

    FSbDeviceList.Add( u );

    Result := u;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbDeviceSave( XML_Doc : IXMLDocument );
var
	XML_rs    	: IXMLNode;
	XML_data2   : IXMLNode;
    x, i : integer;
    sb : TSbDevice;

begin

    for i:=0 to FSbDeviceList.Count-1 do begin

        XML_rs := XML_Doc.DocumentElement.AddChild( 'SbDevice' );

        sb  := FSbDeviceList.Data[i];
        x   := 0;

        if True = sb.E_Id then begin
            XML_data2 			:= XML_rs.AddChild( tbl_20[x] );
            XML_data2.NodeValue := sb.F_Id;
        end;

        Inc( x );

        if True = sb.E_ParentStationId then begin
            XML_data2 			:= XML_rs.AddChild( tbl_20[x] );
            XML_data2.NodeValue := sb.F_ParentStationId;
        end;

        Inc( x );

        if True = sb.E_StationId then begin
            XML_data2 			:= XML_rs.AddChild( tbl_20[x] );
            XML_data2.NodeValue := sb.F_StationId;
        end;

        Inc( x );

        if True = sb.E_TypeName then begin
            XML_data2 			:= XML_rs.AddChild( tbl_20[x] );
            XML_data2.NodeValue := sb.F_TypeName;
        end;

        Inc( x );

        if True = sb.E_Name then begin
            XML_data2 			:= XML_rs.AddChild( tbl_20[x] );
            XML_data2.NodeValue := sb.F_Name;
        end;

        Inc( x );

        if True = sb.E_IpAddress then begin
            XML_data2 			:= XML_rs.AddChild( tbl_20[x] );
            XML_data2.NodeValue := sb.F_IpAddress;
        end;

        Inc( x );

        if True = sb.E_TimeoutMsec then begin
            XML_data2 			:= XML_rs.AddChild( tbl_20[x] );
            XML_data2.NodeValue := sb.F_TimeoutMsec;
        end;

        Inc( x );

        if True = sb.E_IsSendTarget then begin
            XML_data2 			:= XML_rs.AddChild( tbl_20[x] );
            XML_data2.NodeValue := sb.F_IsSendTarget;
        end;

        Inc( x );

        if True = sb.E_IsRecvTarget then begin
            XML_data2 			:= XML_rs.AddChild( tbl_20[x] );
            XML_data2.NodeValue := sb.F_IsRecvTarget;
        end;

        Inc( x );

        if True = sb.E_IsKeyAssign then begin
            XML_data2 			:= XML_rs.AddChild( tbl_20[x] );
            XML_data2.NodeValue := sb.F_IsKeyAssign;
        end;

        Inc( x );

        if True = sb.E_KeyAssignPageCount then begin
            XML_data2 			:= XML_rs.AddChild( tbl_20[x] );
            XML_data2.NodeValue := sb.F_KeyAssignPageCount;
        end;


        Inc( x );

        if True = sb.E_Attribute then begin
            XML_data2 			:= XML_rs.AddChild( tbl_20[x] );
            XML_data2.NodeValue := sb.F_Attribute;
        end;

        Inc( x );

        if True = sb.E_IsEditLocked then begin
            XML_data2 			:= XML_rs.AddChild( tbl_20[x] );
            XML_data2.NodeValue := sb.F_IsEditLocked;
        end;

        Inc( x );

        if True = sb.E_DeviceCategoryName then begin
            XML_data2 			:= XML_rs.AddChild( tbl_20[x] );
            XML_data2.NodeValue := sb.F_DeviceCategoryName;
        end;

        Inc( x );

        if True = sb.E_IsNsbusDevice then begin
            XML_data2 			:= XML_rs.AddChild( tbl_20[x] );
            XML_data2.NodeValue := sb.F_IsNsbusDevice;
        end;

        Inc( x );

        if True = sb.E_Is4kHdChangeSendTarget then begin
            XML_data2 			:= XML_rs.AddChild( tbl_20[x] );
            XML_data2.NodeValue := sb.F_Is4kHdChangeSendTarget;
        end;

        Inc( x );

        if True = sb.E_SentSystemMode then begin
            XML_data2 			:= XML_rs.AddChild( tbl_20[x] );
            XML_data2.NodeValue := sb.F_SentSystemMode;
        end;

    end;

end;

const
    tbl_21  : array [0..28] of string = (
        'F_Id',
        'F_Name',
        'F_Note',
        'F_UiKey',
        'F_PageCount',
        'F_HasBusNameLabel',
        'F_KeyCount',
        'F_HasControlDst',
        'F_CanCdsAssign',
        'F_CanSrcAssign',
        'F_CanDstAssign',
        'F_CanDstAssignEachPages',
        'F_CanFncAssign',
        'F_AssignCancelSrcDstGpSel',
        'F_CdsStartBytes',
        'F_CdsPageByteCount',
        'F_CdsIsLitteEndian',
        'F_SrcStartBytes',
        'F_SrcPageByteCount',
        'F_DstStartBytes',
        'F_DstPageByteCount',
        'F_IsCdstAutoAssign',
        'F_AvailablePageStartBytes',
        'F_CanPageCountSetting',
        'F_SrcDstAreaZeroClearDisabled',
        'F_IsSrcDstBothPanel',
        'F_IsManualInputModeSupported',
        'F_IsOpeMdEnabled',
        'F_IsOpeBpsEnabled'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function TSBusDb.SbPanelTypeLoad( cnl : IXMLNodeList ) : TSbPanelType;
var
    j : integer;
    str, txt : string;
    u : TSbPanelType;

begin

    u := TSbPanelType.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl_21 ) of
        0:  begin u.F_Id                      := txt;   u.E_Id                      := True;    end;
        1:  begin u.F_Name                    := txt;   u.E_Name                    := True;    end;
        2:  begin u.F_Note                    := txt;   u.E_Note                    := True;    end;
        3:  begin u.F_UiKey                   := txt;   u.E_UiKey                   := True;    end;
        4:  begin u.F_PageCount               := txt;   u.E_PageCount               := True;    end;
        5:  begin u.F_HasBusNameLabel         := txt;   u.E_HasBusNameLabel         := True;    end;
        6:  begin u.F_KeyCount                := txt;   u.E_KeyCount                := True;    end;
        7:  begin u.F_HasControlDst           := txt;   u.E_HasControlDst           := True;    end;
        8:  begin u.F_CanCdsAssign            := txt;   u.E_CanCdsAssign            := True;    end;
        9:  begin u.F_CanSrcAssign            := txt;   u.E_CanSrcAssign            := True;    end;
        10: begin u.F_CanDstAssign            := txt;   u.E_CanDstAssign            := True;    end;
        11: begin u.F_CanDstAssignEachPages   := txt;   u.E_CanDstAssignEachPages   := True;    end;
        12: begin u.F_CanFncAssign            := txt;   u.E_CanFncAssign            := True;    end;
        13: begin u.F_AssignCancelSrcDstGpSel := txt;   u.E_AssignCancelSrcDstGpSel := True;    end;
        14: begin u.F_CdsStartBytes           := txt;   u.E_CdsStartBytes           := True;    end;
        15: begin u.F_CdsPageByteCount        := txt;   u.E_CdsPageByteCount        := True;    end;
        16: begin u.F_CdsIsLitteEndian        := txt;   u.E_CdsIsLitteEndian        := True;    end;
        17: begin u.F_SrcStartBytes           := txt;   u.E_SrcStartBytes           := True;    end;
        18: begin u.F_SrcPageByteCount        := txt;   u.E_SrcPageByteCount        := True;    end;
        19: begin u.F_DstStartBytes           := txt;   u.E_DstStartBytes           := True;    end;
        20: begin u.F_DstPageByteCount        := txt;   u.E_DstPageByteCount        := True;    end;
        21: begin u.F_IsCdstAutoAssign        := txt;   u.E_IsCdstAutoAssign        := True;    end;
        22: begin u.F_AvailablePageStartBytes := txt;   u.E_AvailablePageStartBytes := True;    end;
        23: begin u.F_CanPageCountSetting     := txt;   u.E_CanPageCountSetting     := True;    end;
        24: begin u.F_SrcDstAreaZeroClearDisabled := txt;   u.E_SrcDstAreaZeroClearDisabled := True;    end;
        25: begin u.F_IsSrcDstBothPanel           := txt;   u.E_IsSrcDstBothPanel           := True;    end;
        26: begin u.F_IsManualInputModeSupported  := txt;   u.E_IsManualInputModeSupported  := True;    end;
        27: begin u.F_IsOpeMdEnabled              := txt;   u.E_IsOpeMdEnabled              := True;    end;
        28: begin u.F_IsOpeBpsEnabled             := txt;   u.E_IsOpeBpsEnabled             := True;    end;

        else
            begin
                _beep;
            end;
        end;
    end;

    FSbPanelTypeList.Add( u );

    Result := u;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbPanelTypeSave( XML_Doc : IXMLDocument );
var
	XML_rs    	: IXMLNode;
	XML_data2   : IXMLNode;
    x, i : integer;
    sb : TSbPanelType;

begin

    for i:=0 to FSbPanelTypeList.Count-1 do begin

        XML_rs := XML_Doc.DocumentElement.AddChild( 'SbPanelType' );

        sb  := FSbPanelTypeList.Data[i];
        x   := 0;

        if True = sb.E_Id then begin
            XML_data2 			:= XML_rs.AddChild( tbl_21[x] );
            XML_data2.NodeValue := sb.F_Id;
        end;

        Inc( x );

        if True = sb.E_Name then begin
            XML_data2 			:= XML_rs.AddChild( tbl_21[x] );
            XML_data2.NodeValue := sb.F_Name;
        end;

        Inc( x );

        if True = sb.E_Note then begin
            XML_data2 			:= XML_rs.AddChild( tbl_21[x] );
            XML_data2.NodeValue := sb.F_Note;
        end;

        Inc( x );

        if True = sb.E_UiKey then begin
            XML_data2 			:= XML_rs.AddChild( tbl_21[x] );
            XML_data2.NodeValue := sb.F_UiKey;
        end;

        Inc( x );

        if True = sb.E_PageCount then begin
            XML_data2 			:= XML_rs.AddChild( tbl_21[x] );
            XML_data2.NodeValue := sb.F_PageCount;
        end;

        Inc( x );

        if True = sb.E_HasBusNameLabel then begin
            XML_data2 			:= XML_rs.AddChild( tbl_21[x] );
            XML_data2.NodeValue := sb.F_HasBusNameLabel;
        end;

        Inc( x );

        if True = sb.E_KeyCount then begin
            XML_data2 			:= XML_rs.AddChild( tbl_21[x] );
            XML_data2.NodeValue := sb.F_KeyCount;
        end;

        Inc( x );

        if True = sb.E_HasControlDst then begin
            XML_data2 			:= XML_rs.AddChild( tbl_21[x] );
            XML_data2.NodeValue := sb.F_HasControlDst;
        end;

        Inc( x );

        if True = sb.E_CanCdsAssign then begin
            XML_data2 			:= XML_rs.AddChild( tbl_21[x] );
            XML_data2.NodeValue := sb.F_CanCdsAssign;
        end;

        Inc( x );

        if True = sb.E_CanSrcAssign then begin
            XML_data2 			:= XML_rs.AddChild( tbl_21[x] );
            XML_data2.NodeValue := sb.F_CanSrcAssign;
        end;

        Inc( x );

        if True = sb.E_CanDstAssign then begin
            XML_data2 			:= XML_rs.AddChild( tbl_21[x] );
            XML_data2.NodeValue := sb.F_CanDstAssign;
        end;

        Inc( x );

        if True = sb.E_CanDstAssignEachPages then begin
            XML_data2 			:= XML_rs.AddChild( tbl_21[x] );
            XML_data2.NodeValue := sb.F_CanDstAssignEachPages;
        end;

        Inc( x );

        if True = sb.E_CanFncAssign then begin
            XML_data2 			:= XML_rs.AddChild( tbl_21[x] );
            XML_data2.NodeValue := sb.F_CanFncAssign;
        end;

        Inc( x );

        if True = sb.E_AssignCancelSrcDstGpSel then begin
            XML_data2 			:= XML_rs.AddChild( tbl_21[x] );
            XML_data2.NodeValue := sb.F_AssignCancelSrcDstGpSel;
        end;

        Inc( x );

        if True = sb.E_CdsStartBytes then begin
            XML_data2 			:= XML_rs.AddChild( tbl_21[x] );
            XML_data2.NodeValue := sb.F_CdsStartBytes;
        end;

        Inc( x );

        if True = sb.E_CdsPageByteCount then begin
            XML_data2 			:= XML_rs.AddChild( tbl_21[x] );
            XML_data2.NodeValue := sb.F_CdsPageByteCount;
        end;

        Inc( x );

        if True = sb.E_CdsIsLitteEndian then begin
            XML_data2 			:= XML_rs.AddChild( tbl_21[x] );
            XML_data2.NodeValue := sb.F_CdsIsLitteEndian;
        end;

        Inc( x );

        if True = sb.E_SrcStartBytes then begin
            XML_data2 			:= XML_rs.AddChild( tbl_21[x] );
            XML_data2.NodeValue := sb.F_SrcStartBytes;
        end;

        Inc( x );

        if True = sb.E_SrcPageByteCount then begin
            XML_data2 			:= XML_rs.AddChild( tbl_21[x] );
            XML_data2.NodeValue := sb.F_SrcPageByteCount;
        end;

        Inc( x );

        if True = sb.E_DstStartBytes then begin
            XML_data2 			:= XML_rs.AddChild( tbl_21[x] );
            XML_data2.NodeValue := sb.F_DstStartBytes;
        end;

        Inc( x );

        if True = sb.E_DstPageByteCount then begin
            XML_data2 			:= XML_rs.AddChild( tbl_21[x] );
            XML_data2.NodeValue := sb.F_DstPageByteCount;
        end;

        Inc( x );

        if True = sb.E_IsCdstAutoAssign then begin
            XML_data2 			:= XML_rs.AddChild( tbl_21[x] );
            XML_data2.NodeValue := sb.F_IsCdstAutoAssign;
        end;

        Inc( x );

        if True = sb.E_AvailablePageStartBytes then begin
            XML_data2 			:= XML_rs.AddChild( tbl_21[x] );
            XML_data2.NodeValue := sb.F_AvailablePageStartBytes;
        end;

        Inc( x );

        if True = sb.E_CanPageCountSetting then begin
            XML_data2 			:= XML_rs.AddChild( tbl_21[x] );
            XML_data2.NodeValue := sb.F_CanPageCountSetting;
        end;

        Inc( x );

        if True = sb.E_SrcDstAreaZeroClearDisabled then begin
            XML_data2 			:= XML_rs.AddChild( tbl_21[x] );
            XML_data2.NodeValue := sb.F_SrcDstAreaZeroClearDisabled;
        end;

        Inc( x );

        if True = sb.E_IsSrcDstBothPanel then begin
            XML_data2 			:= XML_rs.AddChild( tbl_21[x] );
            XML_data2.NodeValue := sb.F_IsSrcDstBothPanel;
        end;

        Inc( x );

        if True = sb.E_IsManualInputModeSupported then begin
            XML_data2 			:= XML_rs.AddChild( tbl_21[x] );
            XML_data2.NodeValue := sb.F_IsManualInputModeSupported;
        end;

        Inc( x );

        if True = sb.E_IsOpeMdEnabled then begin
            XML_data2 			:= XML_rs.AddChild( tbl_21[x] );
            XML_data2.NodeValue := sb.F_IsOpeMdEnabled;
        end;

        Inc( x );

        if True = sb.E_IsOpeBpsEnabled then begin
            XML_data2 			:= XML_rs.AddChild( tbl_21[x] );
            XML_data2.NodeValue := sb.F_IsOpeBpsEnabled;
        end;

    end;

end;

const
    tbl_22  : array [0..6] of string = (
        'F_Id',
        'F_Name',
        'F_PanelTypeId',
        'F_IsSubnetControllable',
        'F_IsSoapSupported',
        'F_IsNsBusDevice',
        'F_IsPanelTypeVisible'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function TSBusDb.SbDeviceTypeLoad( cnl : IXMLNodeList ) : TSbDeviceType;
var
    j : integer;
    str, txt : string;
    u : TSbDeviceType;

begin

    u := TSbDeviceType.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl_22 ) of
        0:  begin u.F_Id                      := txt;   u.E_Id                      := True;    end;
        1:  begin u.F_Name                    := txt;   u.E_Name                    := True;    end;
        2:  begin u.F_PanelTypeId             := txt;   u.E_PanelTypeId             := True;    end;
        3:  begin u.F_IsSubnetControllable    := txt;   u.E_IsSubnetControllable    := True;    end;
        4:  begin u.F_IsSoapSupported         := txt;   u.E_IsSoapSupported         := True;    end;
        5:  begin u.F_IsNsBusDevice           := txt;   u.E_IsNsBusDevice           := True;    end;
        6:  begin u.F_IsPanelTypeVisible      := txt;   u.E_IsPanelTypeVisible      := True;    end;
        else
            begin
                _beep;
            end;
        end;
    end;

    FSbDeviceTypeList.Add( u );

    Result := u;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbDeviceTypeSave( XML_Doc : IXMLDocument );
var
	XML_rs    	: IXMLNode;
	XML_data2   : IXMLNode;
    x, i : integer;
    sb : TSbDeviceType;

begin

    for i:=0 to FSbDeviceTypeList.Count-1 do begin

        XML_rs := XML_Doc.DocumentElement.AddChild( 'SbDeviceType' );

        sb  := FSbDeviceTypeList.Data[i];
        x   := 0;

        if True = sb.E_Id then begin
            XML_data2 			:= XML_rs.AddChild( tbl_22[x] );
            XML_data2.NodeValue := sb.F_Id;
        end;

        Inc( x );

        if True = sb.E_Name then begin
            XML_data2 			:= XML_rs.AddChild( tbl_22[x] );
            XML_data2.NodeValue := sb.F_Name;
        end;

        Inc( x );

        if True = sb.E_PanelTypeId then begin
            XML_data2 			:= XML_rs.AddChild( tbl_22[x] );
            XML_data2.NodeValue := sb.F_PanelTypeId;
        end;

        Inc( x );
        if True = sb.E_IsSubnetControllable then begin
            XML_data2 			:= XML_rs.AddChild( tbl_22[x] );
            XML_data2.NodeValue := sb.F_IsSubnetControllable;
        end;

        Inc( x );

        if True = sb.E_IsSoapSupported then begin
            XML_data2 			:= XML_rs.AddChild( tbl_22[x] );
            XML_data2.NodeValue := sb.F_IsSoapSupported;
        end;

        Inc( x );

        if True = sb.E_IsNsBusDevice then begin
            XML_data2 			:= XML_rs.AddChild( tbl_22[x] );
            XML_data2.NodeValue := sb.F_IsNsBusDevice;
        end;

        Inc( x );

        if True = sb.E_IsPanelTypeVisible then begin
            XML_data2 			:= XML_rs.AddChild( tbl_22[x] );
            XML_data2.NodeValue := sb.F_IsPanelTypeVisible;
        end;
    end;
end;

const
    tbl_23  : array [0..11] of string = (
        'F_Id',
        'F_Name',
        'F_ColorName',
        'F_Text',
        'F_RecvLevelNo',
        'F_SendLevelBitMask',
        'F_SendLevelBitMaskOffLine',
        'F_DstPortNoRange',
        'F_SrcPortNoRange',
        'F_NoAssignDstNo',
        'F_NoAssignSrcNo',
        'F_IsVirtual'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbXptBusLoad( cnl : IXMLNodeList );
var
    j : integer;
    str, txt : string;
    u : TSbXptBus;

begin

    u := TSbXptBus.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl_23 ) of
        0:  begin u.F_Id                  := txt;   u.E_Id                  := True;    end;
        1:  begin u.F_Name                := txt;   u.E_Name                := True;    end;
        2:  begin u.F_ColorName           := txt;   u.E_ColorName           := True;    end;
        3:  begin u.F_Text                := txt;   u.E_Text                := True;    end;
        4:  begin u.F_RecvLevelNo         := txt;   u.E_RecvLevelNo         := True;    end;
        5:  begin u.F_SendLevelBitMask    := txt;   u.E_SendLevelBitMask    := True;    end;
        6:  begin u.F_SendLevelBitMaskOffLine       := txt;     u.E_SendLevelBitMaskOffLine       := True;  end;
        7:  begin u.F_DstPortNoRange      := txt;   u.E_DstPortNoRange      := True;    end;
        8:  begin u.F_SrcPortNoRange      := txt;   u.E_SrcPortNoRange      := True;    end;
        9:  begin u.F_NoAssignDstNo       := txt;   u.E_NoAssignDstNo       := True;    end;
        10: begin u.F_NoAssignSrcNo       := txt;   u.E_NoAssignSrcNo       := True;    end;
        11: begin u.F_IsVirtual           := txt;   u.E_IsVirtual           := True;    end;
        else
            begin
                _beep;
            end;
        end;
    end;

    FSbXptBusList.Add( u );
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbXptBusSave( XML_Doc : IXMLDocument );
var
	XML_rs    	: IXMLNode;
	XML_data2   : IXMLNode;
    x, i : integer;
    sb : TSbXptBus;

begin

    for i:=0 to FSbXptBusList.Count-1 do begin

        XML_rs := XML_Doc.DocumentElement.AddChild( 'SbXptBus' );

        sb  := FSbXptBusList.Data[i];
        x   := 0;

        if True = sb.E_Id then begin
            XML_data2 			:= XML_rs.AddChild( tbl_23[x] );
            XML_data2.NodeValue := sb.F_Id;
        end;

        Inc( x );

        if True = sb.E_Name then begin
            XML_data2 			:= XML_rs.AddChild( tbl_23[x] );
            XML_data2.NodeValue := sb.F_Name;
        end;

        Inc( x );

        if True = sb.E_ColorName then begin
            XML_data2 			:= XML_rs.AddChild( tbl_23[x] );
            XML_data2.NodeValue := sb.F_ColorName;
        end;

        Inc( x );

        if True = sb.E_Text then begin
            XML_data2 			:= XML_rs.AddChild( tbl_23[x] );
            XML_data2.NodeValue := sb.F_Text;
        end;

        Inc( x );

        if True = sb.E_RecvLevelNo then begin
            XML_data2 			:= XML_rs.AddChild( tbl_23[x] );
            XML_data2.NodeValue := sb.F_RecvLevelNo;
        end;

        Inc( x );

        if True = sb.E_SendLevelBitMask then begin
            XML_data2 			:= XML_rs.AddChild( tbl_23[x] );
            XML_data2.NodeValue := sb.F_SendLevelBitMask;
        end;

        Inc( x );

        if True = sb.E_SendLevelBitMaskOffLine then begin
            XML_data2 			:= XML_rs.AddChild( tbl_23[x] );
            XML_data2.NodeValue := sb.F_SendLevelBitMaskOffLine;
        end;

        Inc( x );

        if True = sb.E_DstPortNoRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_23[x] );
            XML_data2.NodeValue := sb.F_DstPortNoRange;
        end;

        Inc( x );

        if True = sb.E_SrcPortNoRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_23[x] );
            XML_data2.NodeValue := sb.F_SrcPortNoRange;
        end;

        Inc( x );

        if True = sb.E_NoAssignDstNo then begin
            XML_data2 			:= XML_rs.AddChild( tbl_23[x] );
            XML_data2.NodeValue := sb.F_NoAssignDstNo;
        end;

        Inc( x );

        if True = sb.E_NoAssignSrcNo then begin
            XML_data2 			:= XML_rs.AddChild( tbl_23[x] );
            XML_data2.NodeValue := sb.F_NoAssignSrcNo;
        end;

        Inc( x );

        if True = sb.E_IsVirtual then begin
            XML_data2 			:= XML_rs.AddChild( tbl_23[x] );
            XML_data2.NodeValue := sb.F_IsVirtual;
        end;

    end;
end;

const
    tbl_24  : array [0..5] of string = (
        'F_Id',
        'F_Name',
        'F_AliasNo',
        'F_SrcPortNoRange',
        'F_IsProgramSendTarget',
        'F_Note'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbSrcNameBusLoad( cnl : IXMLNodeList );
var
    j : integer;
    str, txt : string;
    u : TSbSrcNameBus;

begin

    u := TSbSrcNameBus.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl_24 ) of
        0:  begin u.F_Id                  := txt;   u.E_Id                  := True;    end;
        1:  begin u.F_Name                := txt;   u.E_Name                := True;    end;
        2:  begin u.F_AliasNo             := txt;   u.E_AliasNo             := True;    end;
        3:  begin u.F_SrcPortNoRange      := txt;   u.E_SrcPortNoRange      := True;    end;
        4:  begin u.F_IsProgramSendTarget := txt;   u.E_IsProgramSendTarget := True;    end;
        5:  begin u.F_Note                := txt;   u.E_Note                := True;    end;
        else
            begin
                _beep;
            end;
        end;
    end;

    FSbSrcNameBusList.Add( u );
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbSrcNameBusSave( XML_Doc : IXMLDocument );
var
	XML_rs    	: IXMLNode;
	XML_data2   : IXMLNode;
    x, i : integer;
    sb : TSbSrcNameBus;

begin

    for i:=0 to FSbSrcNameBusList.Count-1 do begin

        XML_rs := XML_Doc.DocumentElement.AddChild( 'SbSrcNameBus' );

        sb  := FSbSrcNameBusList.Data[i];
        x   := 0;

        if True = sb.E_Id then begin
            XML_data2 			:= XML_rs.AddChild( tbl_24[x] );
            XML_data2.NodeValue := sb.F_Id;
        end;

        Inc( x );

        if True = sb.E_Name then begin
            XML_data2 			:= XML_rs.AddChild( tbl_24[x] );
            XML_data2.NodeValue := sb.F_Name;
        end;

        Inc( x );

        if True = sb.E_AliasNo then begin
            XML_data2 			:= XML_rs.AddChild( tbl_24[x] );
            XML_data2.NodeValue := sb.F_AliasNo;
        end;

        Inc( x );

        if True = sb.E_SrcPortNoRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_24[x] );
            XML_data2.NodeValue := sb.F_SrcPortNoRange;
        end;

        Inc( x );

        if True = sb.E_IsProgramSendTarget then begin
            XML_data2 			:= XML_rs.AddChild( tbl_24[x] );
            XML_data2.NodeValue := sb.F_IsProgramSendTarget;
        end;

        Inc( x );

        if True = sb.E_Note then begin
            XML_data2 			:= XML_rs.AddChild( tbl_24[x] );
            XML_data2.NodeValue := sb.F_Note;
        end;

    end;
end;

const
    tbl_25  : array [0..3] of string = (
        'F_Id',
        'F_Name',
        'F_SrcPortNoRange',
        'F_Note'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbSrcNameGroupLoad( cnl : IXMLNodeList );
var
    j : integer;
    str, txt : string;
    u : TSbSrcNameGroup;

begin

    u := TSbSrcNameGroup.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl_25 ) of
        0:  begin u.F_Id                  := txt;   u.E_Id                  := True;    end;
        1:  begin u.F_Name                := txt;   u.E_Name                := True;    end;
        2:  begin u.F_SrcPortNoRange      := txt;   u.E_SrcPortNoRange      := True;    end;
        3:  begin u.F_Note                := txt;   u.E_Note                := True;    end;
        else
            begin
                _beep;
            end;
        end;

    end;

    FSbSrcNameGroupList.Add( u );
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbSrcNameGroupSave( XML_Doc : IXMLDocument );
var
	XML_rs    	: IXMLNode;
	XML_data2   : IXMLNode;
    x, i : integer;
    sb : TSbSrcNameGroup;

begin

    for i:=0 to FSbSrcNameGroupList.Count-1 do begin

        XML_rs := XML_Doc.DocumentElement.AddChild( 'SbSrcNameGroup' );

        sb  := FSbSrcNameGroupList.Data[i];
        x   := 0;

        if True = sb.E_Id then begin
            XML_data2 			:= XML_rs.AddChild( tbl_25[x] );
            XML_data2.NodeValue := sb.F_Id;
        end;

        Inc( x );

        if True = sb.E_Name then begin
            XML_data2 			:= XML_rs.AddChild( tbl_25[x] );
            XML_data2.NodeValue := sb.F_Name;
        end;

        Inc( x );

        if True = sb.E_SrcPortNoRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_25[x] );
            XML_data2.NodeValue := sb.F_SrcPortNoRange;
        end;

        Inc( x );

        if True = sb.E_Note then begin
            XML_data2 			:= XML_rs.AddChild( tbl_25[x] );
            XML_data2.NodeValue := sb.F_Note;
        end;
    end;
end;

const
    tbl_26  : array [0..5] of string = (
        'F_Id',
        'F_Name',
        'F_AliasNo',
        'F_DstPortNoRange',
        'F_IsProgramSendTarget',
        'F_Note'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbDstNameBusLoad( cnl : IXMLNodeList );
var
    j : integer;
    str, txt : string;
    u : TSbDstNameBus;

begin

    u := TSbDstNameBus.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;
        case AnsiIndexStr( str, tbl_26 ) of
        0:  begin u.F_Id                  := txt;   u.E_Id                  := True;    end;
        1:  begin u.F_Name                := txt;   u.E_Name                := True;    end;
        2:  begin u.F_AliasNo             := txt;   u.E_AliasNo             := True;    end;
        3:  begin u.F_DstPortNoRange      := txt;   u.E_DstPortNoRange      := True;    end;
        4:  begin u.F_IsProgramSendTarget := txt;   u.E_IsProgramSendTarget := True;    end;
        5:  begin u.F_Note                := txt;   u.E_Note                := True;    end;
        else
            begin
                _beep;
            end;
        end;

    end;

    FSbDstNameBusList.Add( u );
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbDstNameBusSave( XML_Doc : IXMLDocument );
var
	XML_rs    	: IXMLNode;
	XML_data2   : IXMLNode;
    x, i : integer;
    sb : TSbDstNameBus;

begin

    for i:=0 to FSbDstNameBusList.Count-1 do begin

        XML_rs := XML_Doc.DocumentElement.AddChild( 'SbDstNameBus' );

        sb  := FSbDstNameBusList.Data[i];
        x   := 0;

        if True = sb.E_Id then begin
            XML_data2 			:= XML_rs.AddChild( tbl_26[x] );
            XML_data2.NodeValue := sb.F_Id;
        end;

        Inc( x );

        if True = sb.E_Name then begin
            XML_data2 			:= XML_rs.AddChild( tbl_26[x] );
            XML_data2.NodeValue := sb.F_Name;
        end;

        Inc( x );

        if True = sb.E_AliasNo then begin
            XML_data2 			:= XML_rs.AddChild( tbl_26[x] );
            XML_data2.NodeValue := sb.F_AliasNo;
        end;

        Inc( x );

        if True = sb.E_DstPortNoRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_26[x] );
            XML_data2.NodeValue := sb.F_DstPortNoRange;
        end;

        Inc( x );

        if True = sb.E_IsProgramSendTarget then begin
            XML_data2 			:= XML_rs.AddChild( tbl_26[x] );
            XML_data2.NodeValue := sb.F_IsProgramSendTarget;
        end;

        Inc( x );

        if True = sb.E_Note then begin
            XML_data2 			:= XML_rs.AddChild( tbl_26[x] );
            XML_data2.NodeValue := sb.F_Note;
        end;

    end;
end;

const
    tbl_27  : array [0..1] of string = (
        'F_Id',
        'F_Text'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbPanelFunctionKeyDefineLoad( cnl : IXMLNodeList );
var
    j : integer;
    str, txt : string;
    u : TSbPanelFunctionKeyDefine;

begin

    u := TSbPanelFunctionKeyDefine.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl_27 ) of
        0:  begin u.F_Id                  := txt;   u.E_Id                  := True;    end;
        1:  begin u.F_Text                := txt;   u.E_Text                := True;    end;
        else
            begin
                _beep;
            end;
        end;

    end;

    FSbPanelFunctionKeyDefineList.Add( u );
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbPanelFunctionKeyDefineSave( XML_Doc : IXMLDocument );
var
	XML_rs    	: IXMLNode;
	XML_data2   : IXMLNode;
    x, i : integer;
    sb : TSbPanelFunctionKeyDefine;

begin

    for i:=0 to FSbPanelFunctionKeyDefineList.Count-1 do begin

        XML_rs := XML_Doc.DocumentElement.AddChild( 'SbPanelFunctionKeyDefine' );

        sb  := FSbPanelFunctionKeyDefineList.Data[i];
        x   := 0;

        if True = sb.E_Id then begin
            XML_data2 			:= XML_rs.AddChild( tbl_27[x] );
            XML_data2.NodeValue := sb.F_Id;
        end;

        Inc( x );

        if True = sb.E_Text then begin
            XML_data2 			:= XML_rs.AddChild( tbl_27[x] );
            XML_data2.NodeValue := sb.F_Text;
        end;

    end;
end;

const
    tbl_28  : array [0..3] of string = (
        'F_Id',
        'F_PanelTypeId',
        'F_FunctionId',
        'F_FunctionNo'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbPanelFunctionKeyMappingLoad( cnl : IXMLNodeList );
var
    j : integer;
    str, txt : string;
    u : TSbPanelFunctionKeyMapping;

begin

    u := TSbPanelFunctionKeyMapping.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl_28 ) of
        0:  begin u.F_Id          := txt;   u.E_Id          := True;    end;
        1:  begin u.F_PanelTypeId := txt;   u.E_PanelTypeId := True;    end;
        2:  begin u.F_FunctionId  := txt;   u.E_FunctionId  := True;    end;
        3:  begin u.F_FunctionNo  := txt;   u.E_FunctionNo  := True;    end;
        else
            begin
                _beep;
            end;
        end;

    end;

    FSbPanelFunctionKeyMappingList.Add( u );
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbPanelFunctionKeyMappingSave( XML_Doc : IXMLDocument );
var
	XML_rs    	: IXMLNode;
	XML_data2   : IXMLNode;
    x, i : integer;
    sb : TSbPanelFunctionKeyMapping;

begin

    for i:=0 to FSbPanelFunctionKeyMappingList.Count-1 do begin

        XML_rs := XML_Doc.DocumentElement.AddChild( 'SbPanelFunctionKeyMapping' );

        sb  := FSbPanelFunctionKeyMappingList.Data[i];
        x   := 0;

        if True = sb.E_Id then begin
            XML_data2 			:= XML_rs.AddChild( tbl_28[x] );
            XML_data2.NodeValue := sb.F_Id;
        end;

        Inc( x );

        if True = sb.E_PanelTypeId then begin
            XML_data2 			:= XML_rs.AddChild( tbl_28[x] );
            XML_data2.NodeValue := sb.F_PanelTypeId;
        end;

        Inc( x );

        if True = sb.E_FunctionId then begin
            XML_data2 			:= XML_rs.AddChild( tbl_28[x] );
            XML_data2.NodeValue := sb.F_FunctionId;
        end;

        Inc( x );

        if True = sb.E_FunctionNo then begin
            XML_data2 			:= XML_rs.AddChild( tbl_28[x] );
            XML_data2.NodeValue := sb.F_FunctionNo;
        end;

    end;
end;

const
    tbl_29  : array [0..1] of string = (
        'F_ValueId',
        'F_Value'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbSettingsLoad( cnl : IXMLNodeList );
var
    j : integer;
    str, txt : string;
    u : TSbSettings;

begin

    u := TSbSettings.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl_29 ) of
        0:  begin u.F_ValueId         := txt;   u.E_ValueId         := True;    end;
        1:  begin u.F_Value           := txt;   u.E_Value           := True;    end;
        else
            begin
                _beep;
            end;
        end;

    end;

    FSbSettingsList.Add( u );
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbSettingsSave( XML_Doc : IXMLDocument );
var
	XML_rs    	: IXMLNode;
	XML_data2   : IXMLNode;
    x, i : integer;
    sb : TSbSettings;

begin

    for i:=0 to FSbSettingsList.Count-1 do begin

        XML_rs := XML_Doc.DocumentElement.AddChild( 'SbSettings' );

        sb  := FSbSettingsList.Data[i];
        x   := 0;

        if True = sb.E_ValueId then begin
            XML_data2 			:= XML_rs.AddChild( tbl_29[x] );
            XML_data2.NodeValue := sb.F_ValueId;
        end;

        Inc( x );

        if True = sb.E_Value then begin
            XML_data2 			:= XML_rs.AddChild( tbl_29[x] );
            XML_data2.NodeValue := sb.F_Value;
        end;
    end;
end;

const
    tbl_2A  : array [0..3] of string = (
        'F_Id',
        'F_Name',
        'F_DstPortNoRange',
        'F_Note'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbDstNameGroupLoad( cnl : IXMLNodeList );
var
    j : integer;
    str, txt : string;
    u : TSbDstNameGroup;

begin

    u := TSbdstNameGroup.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl_2A ) of
        0:  begin u.F_Id                  := txt;   u.E_Id                  := True;    end;
        1:  begin u.F_Name                := txt;   u.E_Name                := True;    end;
        2:  begin u.F_DstPortNoRange      := txt;   u.E_DstPortNoRange      := True;    end;
        3:  begin u.F_Note                := txt;   u.E_Note                := True;    end;
        else
            begin
                _beep;
            end;
        end;

    end;

    FSbDstNameGroupList.Add( u );
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbDstNameGroupSave( XML_Doc : IXMLDocument );
var
	XML_rs    	: IXMLNode;
	XML_data2   : IXMLNode;
    x, i : integer;
    sb : TSbDstNameGroup;

begin

    for i:=0 to FSbDstNameGroupList.Count-1 do begin

        XML_rs := XML_Doc.DocumentElement.AddChild( 'SbDstNameGroup' );

        sb  := FSbDstNameGroupList.Data[i];
        x   := 0;

        if True = sb.E_Id then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2A[x] );
            XML_data2.NodeValue := sb.F_Id;
        end;

        Inc( x );

        if True = sb.E_Name then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2A[x] );
            XML_data2.NodeValue := sb.F_Name;
        end;

        Inc( x );

        if True = sb.E_DstPortNoRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2A[x] );
            XML_data2.NodeValue := sb.F_DstPortNoRange;
        end;

        Inc( x );

        if True = sb.E_Note then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2A[x] );
            XML_data2.NodeValue := sb.F_Note;
        end;
    end;
end;

const
    tbl_2B  : array [0..3] of string = (
        'F_DstPortNo',
        'F_IsInhibit',
        'F_IsReadOnly',
        'F_XptCategory'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbDstInhibitLoad( cnl : IXMLNodeList );
var
    j : integer;
    str, txt : string;
    u : TSbDstInhibit;

begin

    u := TSbDstInhibit.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl_2B ) of
        0:  begin u.F_DstPortNo           := txt;   u.E_DstPortNo           := True;    end;
        1:  begin u.F_IsInhibit           := txt;   u.E_IsInhibit           := True;    end;
        2:  begin u.F_IsReadOnly          := txt;   u.E_IsReadOnly          := True;    end;
        3:  begin u.F_XptCategor          := txt;   u.E_XptCategor          := True;    end;
        else
            begin
                _beep;
            end;
        end;

    end;

    FSbDstInhibitList.Add( u );
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbDstInhibitSave( XML_Doc : IXMLDocument );
var
	XML_rs    	: IXMLNode;
	XML_data2   : IXMLNode;
    x, i : integer;
    sb : TSbDstInhibit;

begin

    for i:=0 to FSbDstInhibitList.Count-1 do begin

        XML_rs := XML_Doc.DocumentElement.AddChild( 'SbDstInhibit' );

        sb  := FSbDstInhibitList.Data[i];
        x   := 0;

        if True = sb.E_DstPortNo then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2B[x] );
            XML_data2.NodeValue := sb.F_DstPortNo;
        end;

        Inc( x );

        if True = sb.E_IsInhibit then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2B[x] );
            XML_data2.NodeValue := sb.F_IsInhibit;
        end;

        Inc( x );

        if True = sb.E_IsReadOnly then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2B[x] );
            XML_data2.NodeValue := sb.F_IsReadOnly;
        end;

        Inc( x );

        if True = sb.E_XptCategor then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2B[x] );
            XML_data2.NodeValue := sb.F_XptCategor;
        end;
    end;
end;

const
    tbl_2C  : array [0..3] of string = (
        'F_AlarmCode',
        'F_Level',
        'F_Message',
        'F_IsRecoverable'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbAlarmDefineLoad( cnl : IXMLNodeList );
var
    j : integer;
    str, txt : string;
    u : TSbAlarmDefine;

begin

    u := TSbAlarmDefine.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl_2C ) of
        0:  begin u.F_AlarmCode           := txt;   u.E_AlarmCode           := True;    end;
        1:  begin u.F_Level               := txt;   u.E_Level               := True;    end;
        2:  begin u.F_Message             := txt;   u.E_Message             := True;    end;
        3:  begin u.F_IsRecoverable       := txt;   u.E_IsRecoverable       := True;    end;
        else
            begin
                _beep;
            end;
        end;

    end;

    FSbAlarmDefineList.Add( u );
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbAlarmDefineSave( XML_Doc : IXMLDocument );
var
	XML_rs    	: IXMLNode;
	XML_data2   : IXMLNode;
    x, i : integer;
    sb : TSbAlarmDefine;

begin

    for i:=0 to FSbAlarmDefineList.Count-1 do begin

        XML_rs := XML_Doc.DocumentElement.AddChild( 'SbAlarmDefine' );

        sb  := FSbAlarmDefineList.Data[i];
        x   := 0;

        if True = sb.E_AlarmCode then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2C[x] );
            XML_data2.NodeValue := sb.F_AlarmCode;
        end;

        Inc( x );

        if True = sb.E_Level then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2C[x] );
            XML_data2.NodeValue := sb.F_Level;
        end;

        Inc( x );

        if True = sb.E_Message then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2C[x] );
            XML_data2.NodeValue := sb.F_Message;
        end;

        Inc( x );

        if True = sb.E_IsRecoverable then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2C[x] );
            XML_data2.NodeValue := sb.F_IsRecoverable;
        end;

    end;
end;

const
    tbl_2D : array [0..3] of string = (
        'F_Id',
        'F_PanelTypeId',
        'F_PageNo',
        'F_PageName'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbPanelPageNameLoad( cnl : IXMLNodeList );
var
    j : integer;
    str, txt : string;
    u : TSbPanelPageName;

begin

    u := TSbPanelPageName.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl_2D ) of
        0:  begin u.F_Id                := txt;     u.E_Id                := True;  end;
        1:  begin u.F_PanelTypeId       := txt;     u.E_PanelTypeId       := True;  end;
        2:  begin u.F_PageNo            := txt;     u.E_PageNo            := True;  end;
        3:  begin u.F_PageName          := txt;     u.E_PageName          := True;  end;
        else
            begin
                _beep;
            end;
        end;

    end;

    FSbPanelPageNameList.Add( u );
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbPanelPageNameSave( XML_Doc : IXMLDocument );
var
	XML_rs    	: IXMLNode;
	XML_data2   : IXMLNode;
    x, i : integer;
    sb : TSbPanelPageName;

begin

    for i:=0 to FSbPanelPageNameList.Count-1 do begin

        XML_rs := XML_Doc.DocumentElement.AddChild( 'SbPanelPageName' );

        sb  := FSbPanelPageNameList.Data[i];
        x   := 0;

        if True = sb.E_Id then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2D[x] );
            XML_data2.NodeValue := sb.F_Id;
        end;

        Inc( x );

        if True = sb.E_PanelTypeId then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2D[x] );
            XML_data2.NodeValue := sb.F_PanelTypeId;
        end;

        Inc( x );
        if True = sb.E_PageNo then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2D[x] );
            XML_data2.NodeValue := sb.F_PageNo;
        end;

        Inc( x );
        if True = sb.E_PageName then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2D[x] );
            XML_data2.NodeValue := sb.F_PageName;
        end;
    end;
end;

const
    tbl_2E : array [0..4] of string = (
        'F_DeviceId',
        'F_PageNo',
        'F_PageName',
        'F_DisplayOrder',
        'F_IsVisible'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbDevicePanelPageNameLoad( cnl : IXMLNodeList );
var
    j : integer;
    str, txt : string;
    u : TSbDevicePanelPageName;

begin

    u := TSbDevicePanelPageName.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl_2E ) of
        0:  begin u.F_DeviceId          := txt;     u.E_DeviceId          := True;  end;
        1:  begin u.F_PageNo            := txt;     u.E_PageNo            := True;  end;
        2:  begin u.F_PageName          := txt;     u.E_PageName          := True;  end;
        3:  begin u.F_DisplayOrder      := txt;     u.E_DisplayOrder      := True;  end;
        4:  begin u.F_IsVisible         := txt;     u.E_IsVisible         := True;  end;
        else
            begin
                _beep;
            end;
        end;

    end;

    FSbDevicePanelPageNameList.Add( u );
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbDevicePanelPageNameSave( XML_Doc : IXMLDocument );
var
	XML_rs    	: IXMLNode;
	XML_data2   : IXMLNode;
    x, i : integer;
    sb : TSbDevicePanelPageName;

begin

    for i:=0 to FSbDevicePanelPageNameList.Count-1 do begin

        XML_rs := XML_Doc.DocumentElement.AddChild( 'SbDevicePanelPageName' );

        sb  := FSbDevicePanelPageNameList.Data[i];
        x   := 0;

        if True = sb.E_DeviceId then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2E[x] );
            XML_data2.NodeValue := sb.F_DeviceId;
        end;

        Inc( x );

        if True = sb.E_PageNo then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2E[x] );
            XML_data2.NodeValue := sb.F_PageNo;
        end;

        Inc( x );

        if True = sb.E_PageName then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2E[x] );
            XML_data2.NodeValue := sb.F_PageName;
        end;

        Inc( x );

        if True = sb.E_DisplayOrder then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2E[x] );
            XML_data2.NodeValue := sb.F_DisplayOrder;
        end;

        Inc( x );

        if True = sb.E_IsVisible then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2E[x] );
            XML_data2.NodeValue := sb.F_IsVisible;
        end;

    end;
end;

const
    tbl_2F : array [0..6] of string = (
        'F_Id',
        'F_ScreenRgba',
        'F_ScreenTextRgba',
        'F_ScreenSelectedRgba',
        'F_ScreenTextSelectedRgba',
        'F_AliasText',
        'F_DisplayName'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbSrcColorLoad( cnl : IXMLNodeList );
var
    j : integer;
    str, txt : string;
    u : TSbSrcColor;

    i, n : integer;
    ccn : IXmlNode;
    flg : Boolean;

begin

    u := TSbSrcColor.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        n   := cnl.Nodes[j].AttributeNodes.count;
        flg := False;
        for i:=0 to n-1 do begin
    		ccn     := cnl.Nodes[j].AttributeNodes[i];
            if 'xml:space' = ccn.NodeName then begin
                flg := True;
            end;
        end;

        case AnsiIndexStr( str, tbl_2F ) of
        0:  begin u.F_Id                        := txt;     u.E_Id                        := True;  end;
        1:  begin u.F_ScreenRgba                := txt;     u.E_ScreenRgba                := True;  end;
        2:  begin u.F_ScreenTextRgba            := txt;     u.E_ScreenTextRgba            := True;  end;
        3:  begin u.F_ScreenSelectedRgba        := txt;     u.E_ScreenSelectedRgba        := True;  end;
        4:  begin u.F_ScreenTextSelectedRgba    := txt;     u.E_ScreenTextSelectedRgba    := True;  end;

        5:
            begin
                u.F_AliasText                   := txt;
                u.E_AliasText                   := True;
                u.AliasSpace                    := flg;
            end;

        6:  begin u.F_DisplayName               := txt;     u.E_DisplayName               := True;  end;
        else
            begin
                _beep;
            end;
        end;

    end;

    FSbSrcColorList.Add( u );
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbSrcColorSave( XML_Doc : IXMLDocument );
var
	XML_rs    	: IXMLNode;
	XML_data2   : IXMLNode;
    x, i : integer;
    sb : TSbSrcColor;

begin

    for i:=0 to FSbSrcColorList.Count-1 do begin

        XML_rs := XML_Doc.DocumentElement.AddChild( 'SbSrcColor' );

        sb  := FSbSrcColorList.Data[i];
        x   := 0;

        if True = sb.E_Id then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2F[x] );
            XML_data2.NodeValue := sb.F_Id;
        end;

        Inc( x );

        if True = sb.E_ScreenRgba then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2F[x] );
            XML_data2.NodeValue := sb.F_ScreenRgba;
        end;

        Inc( x );

        if True = sb.E_ScreenTextRgba then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2F[x] );
            XML_data2.NodeValue := sb.F_ScreenTextRgba;
        end;

        Inc( x );

        if True = sb.E_ScreenSelectedRgba then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2F[x] );
            XML_data2.NodeValue := sb.F_ScreenSelectedRgba;
        end;

        Inc( x );

        if True = sb.E_ScreenTextSelectedRgba then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2F[x] );
            XML_data2.NodeValue := sb.F_ScreenTextSelectedRgba;
        end;

        Inc( x );

        if True = sb.E_AliasText then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2F[x] );
            XML_data2.NodeValue := sb.F_AliasText;

            if True = sb.AliasSpace then begin

                XML_data2.Attributes[ 'xml:space' ] := 'preserve';
            end;
        end;

        Inc( x );

        if True = sb.E_DisplayName then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2F[x] );
            XML_data2.NodeValue := sb.F_DisplayName;
        end;
    end;
end;

const
    tbl_2G : array [0..2] of string = (
        'F_DstPortNo',
        'F_IsSbusTarget',
        'F_IsNsBusTarget'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbDstControlTargetLoad( cnl : IXMLNodeList );
var
    j : integer;
    str, txt : string;
    u : TSbDstControlTarget;

begin

    u := TSbDstControlTarget.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl_2G ) of
        0:  begin u.F_DstPortNo           := txt;   u.E_DstPortNo           := True;    end;
        1:  begin u.F_IsSbusTarget        := txt;   u.E_IsSbusTarget        := True;    end;
        2:  begin u.F_IsNsBusTarget       := txt;   u.E_IsNsBusTarget       := True;    end;
        else
            begin
                _beep;
            end;
        end;

    end;

    FSbDstControlTargetList.Add( u );
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbDstControlTargetsave( XML_Doc : IXMLDocument );
var
	XML_rs    	: IXMLNode;
	XML_data2   : IXMLNode;
    x, i : integer;
    sb : TSbDstControlTarget;

begin

    for i:=0 to FSbDstControlTargetList.Count-1 do begin

        XML_rs := XML_Doc.DocumentElement.AddChild( 'SbDstControlTarget' );

        sb  := FSbDstControlTargetList.Data[i];
        x   := 0;

        if True = sb.E_DstPortNo then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2G[x] );
            XML_data2.NodeValue := sb.F_DstPortNo;
        end;

        Inc( x );

        if True = sb.E_IsSbusTarget then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2G[x] );
            XML_data2.NodeValue := sb.F_IsSbusTarget;
        end;

        Inc( x );

        if True = sb.E_IsNsBusTarget then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2G[x] );
            XML_data2.NodeValue := sb.F_IsNsBusTarget;
        end;

    end;
end;

const
    tbl_2H : array [0..3] of string = (
        'F_SrcNo',
        'F_LevelDefineId',
        'F_GroupName',
        'F_ChCount'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbEditSrcSetGroupLoad( cnl : IXMLNodeList );
var
    j : integer;
    str, txt : string;
    u : TSbEditSrcSetGroup;

begin

    u := TSbEditSrcSetGroup.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl_2H ) of
        0:  begin u.F_SrcNo           := txt;   u.E_SrcNo           := True;    end;
        1:  begin u.F_LevelDefineId   := txt;   u.E_LevelDefineId   := True;    end;
        2:  begin u.F_GroupName       := txt;   u.E_GroupName       := True;    end;
        3:  begin u.F_ChCount         := txt;   u.E_ChCount         := True;    end;
        else
            begin
                _beep;
            end;
        end;

    end;

    FSbEditSrcSetGroupList.Add( u );
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbEditSrcSetGroupSave( XML_Doc : IXMLDocument );
var
	XML_rs    	: IXMLNode;
	XML_data2   : IXMLNode;
    x, i : integer;
    sb : TSbEditSrcSetGroup;

begin

    for i:=0 to FSbEditSrcSetGroupList.Count-1 do begin

        XML_rs := XML_Doc.DocumentElement.AddChild( 'SbEditSrcSetGroup' );

        sb  := FSbEditSrcSetGroupList.Data[i];
        x   := 0;

        if True = sb.E_SrcNo then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2H[x] );
            XML_data2.NodeValue := sb.F_SrcNo;
        end;

        Inc( x );

        if True = sb.E_LevelDefineId then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2H[x] );
            XML_data2.NodeValue := sb.F_LevelDefineId;
        end;

        Inc( x );

        if True = sb.E_GroupName then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2H[x] );
            XML_data2.NodeValue := sb.F_GroupName;
        end;

        Inc( x );

        if True = sb.E_ChCount then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2H[x] );
            XML_data2.NodeValue := sb.F_ChCount;
        end;
    end;
end;

const
    tbl_2J : array [0..3] of string = (
        'F_DstNo',
        'F_LevelDefineId',
        'F_GroupName',
        'F_ChCount'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbEditDstSetGroupLoad( cnl : IXMLNodeList );
var
    j : integer;
    str, txt : string;
    u : TSbEditDstSetGroup;

begin

    u := TSbEditdstSetGroup.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl_2J ) of
        0:  begin u.F_dstNo           := txt;   u.E_dstNo           := True;    end;
        1:  begin u.F_LevelDefineId   := txt;   u.E_LevelDefineId   := True;    end;
        2:  begin u.F_GroupName       := txt;   u.E_GroupName       := True;    end;
        3:  begin u.F_ChCount         := txt;   u.E_ChCount         := True;    end;
        else
            begin
                _beep;
            end;
        end;

    end;

    FSbEditDstSetGroupList.Add( u );
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbEditDstSetGroupSave( XML_Doc : IXMLDocument );
var
	XML_rs    	: IXMLNode;
	XML_data2   : IXMLNode;
    x, i : integer;
    sb : TSbEditDstSetGroup;

begin

    for i:=0 to FSbEditDstSetGroupList.Count-1 do begin

        XML_rs := XML_Doc.DocumentElement.AddChild( 'SbEditDstSetGroup' );

        sb  := FSbEditDstSetGroupList.Data[i];
        x   := 0;

        if True = sb.E_DstNo then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2J[x] );
            XML_data2.NodeValue := sb.F_DstNo;
        end;

        Inc( x );

        if True = sb.E_LevelDefineId then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2J[x] );
            XML_data2.NodeValue := sb.F_LevelDefineId;
        end;

        Inc( x );

        if True = sb.E_GroupName then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2J[x] );
            XML_data2.NodeValue := sb.F_GroupName;
        end;

        Inc( x );

        if True = sb.E_ChCount then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2J[x] );
            XML_data2.NodeValue := sb.F_ChCount;
        end;

    end;
end;

const
    tbl_2K : array [0..20] of string = (
        'F_Id',
        'F_EditPortRanges',
        'F_VideoTargetPortRanges',
        'F_AudioTargetPortRanges',
        'F_VideoLevelRange',
        'F_Audio1LevelRange',
        'F_Audio2LevelRange',
        'F_Audio3LevelRange',
        'F_Audio4LevelRange',
        'F_Audio5LevelRange',
        'F_Audio6LevelRange',
        'F_Audio7LevelRange',
        'F_Audio8LevelRange',
        'F_Audio9LevelRange',
        'F_Audio10LevelRange',
        'F_Audio11LevelRange',
        'F_Audio12LevelRange',
        'F_Audio13LevelRange',
        'F_Audio14LevelRange',
        'F_Audio15LevelRange',
        'F_Audio16LevelRange'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbEditSrcLevelDefineLoad( cnl : IXMLNodeList );
var
    j : integer;
    str, txt : string;
    u : TSbEditSrcLevelDefine;

begin

    u := TSbEditSrcLevelDefine.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl_2K ) of
        0:  begin u.F_Id                    := txt;     u.E_Id                      := True;    end;
        1:  begin u.F_EditPortRanges        := txt;     u.E_EditPortRanges          := True;    end;
        2:  begin u.F_VideoTargetPortRanges := txt;     u.E_VideoTargetPortRanges   := True;    end;
        3:  begin u.F_AudioTargetPortRanges := txt;     u.E_AudioTargetPortRanges   := True;    end;
        4:  begin u.F_VideoLevelRange       := txt;     u.E_VideoLevelRange         := True;    end;
        5:  begin u.F_Audio1LevelRange      := txt;     u.E_Audio1LevelRange        := True;    end;
        6:  begin u.F_Audio2LevelRange      := txt;     u.E_Audio2LevelRange        := True;    end;
        7:  begin u.F_Audio3LevelRange      := txt;     u.E_Audio3LevelRange        := True;    end;
        8:  begin u.F_Audio4LevelRange      := txt;     u.E_Audio4LevelRange        := True;    end;
        9:  begin u.F_Audio5LevelRange      := txt;     u.E_Audio5LevelRange        := True;    end;
        10: begin u.F_Audio6LevelRange      := txt;     u.E_Audio6LevelRange        := True;    end;
        11: begin u.F_Audio7LevelRange      := txt;     u.E_Audio7LevelRange        := True;    end;
        12: begin u.F_Audio8LevelRange      := txt;     u.E_Audio8LevelRange        := True;    end;
        13: begin u.F_Audio9LevelRange      := txt;     u.E_Audio9LevelRange        := True;    end;
        14: begin u.F_Audio10LevelRange     := txt;     u.E_Audio10LevelRange       := True;    end;
        15: begin u.F_Audio11LevelRange     := txt;     u.E_Audio11LevelRange       := True;    end;
        16: begin u.F_Audio12LevelRange     := txt;     u.E_Audio12LevelRange       := True;    end;
        17: begin u.F_Audio13LevelRange     := txt;     u.E_Audio13LevelRange       := True;    end;
        18: begin u.F_Audio14LevelRange     := txt;     u.E_Audio14LevelRange       := True;    end;
        19: begin u.F_Audio15LevelRange     := txt;     u.E_Audio15LevelRange       := True;    end;
        20: begin u.F_Audio16LevelRange     := txt;     u.E_Audio16LevelRange       := True;    end;
        else
            begin
                _beep;
            end;
        end;

    end;

    FSbEditSrcLevelDefineList.Add( u );
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbEditSrcLevelDefineSave( XML_Doc : IXMLDocument );
var
	XML_rs    	: IXMLNode;
	XML_data2   : IXMLNode;
    x, i : integer;
    sb : TSbEditSrcLevelDefine;

begin

    for i:=0 to FSbEditSrcLevelDefineList.Count-1 do begin

        XML_rs := XML_Doc.DocumentElement.AddChild( 'SbEditSrcLevelDefine' );

        sb  := FSbEditSrcLevelDefineList.Data[i];
        x   := 0;

        if True = sb.E_Id then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2K[x] );
            XML_data2.NodeValue := sb.F_Id;
        end;

        Inc( x );

        if True = sb.E_EditPortRanges then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2K[x] );
            XML_data2.NodeValue := sb.F_EditPortRanges;
        end;

        Inc( x );

        if True = sb.E_VideoTargetPortRanges then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2K[x] );
            XML_data2.NodeValue := sb.F_VideoTargetPortRanges;
        end;

        Inc( x );

        if True = sb.E_AudioTargetPortRanges then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2K[x] );
            XML_data2.NodeValue := sb.F_AudioTargetPortRanges;
        end;

        Inc( x );

        if True = sb.E_VideoLevelRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2K[x] );
            XML_data2.NodeValue := sb.F_VideoLevelRange;
        end;

        Inc( x );

        if True = sb.E_Audio1LevelRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2K[x] );
            XML_data2.NodeValue := sb.F_Audio1LevelRange;
        end;

        Inc( x );

        if True = sb.E_Audio2LevelRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2K[x] );
            XML_data2.NodeValue := sb.F_Audio2LevelRange;
        end;

        Inc( x );

        if True = sb.E_Audio3LevelRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2K[x] );
            XML_data2.NodeValue := sb.F_Audio3LevelRange;
        end;

        Inc( x );

        if True = sb.E_Audio4LevelRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2K[x] );
            XML_data2.NodeValue := sb.F_Audio4LevelRange;
        end;

        Inc( x );

        if True = sb.E_Audio5LevelRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2K[x] );
            XML_data2.NodeValue := sb.F_Audio5LevelRange;
        end;

        Inc( x );

        if True = sb.E_Audio6LevelRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2K[x] );
            XML_data2.NodeValue := sb.F_Audio6LevelRange;
        end;

        Inc( x );

        if True = sb.E_Audio7LevelRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2K[x] );
            XML_data2.NodeValue := sb.F_Audio7LevelRange;
        end;

        Inc( x );

        if True = sb.E_Audio8LevelRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2K[x] );
            XML_data2.NodeValue := sb.F_Audio8LevelRange;
        end;

        Inc( x );

        if True = sb.E_Audio9LevelRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2K[x] );
            XML_data2.NodeValue := sb.F_Audio9LevelRange;
        end;

        Inc( x );

        if True = sb.E_Audio10LevelRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2K[x] );
            XML_data2.NodeValue := sb.F_Audio10LevelRange;
        end;

        Inc( x );

        if True = sb.E_Audio11LevelRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2K[x] );
            XML_data2.NodeValue := sb.F_Audio11LevelRange;
        end;

        Inc( x );

        if True = sb.E_Audio12LevelRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2K[x] );
            XML_data2.NodeValue := sb.F_Audio12LevelRange;
        end;

        Inc( x );

        if True = sb.E_Audio13LevelRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2K[x] );
            XML_data2.NodeValue := sb.F_Audio13LevelRange;
        end;

        Inc( x );

        if True = sb.E_Audio14LevelRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2K[x] );
            XML_data2.NodeValue := sb.F_Audio14LevelRange;
        end;

        Inc( x );

        if True = sb.E_Audio15LevelRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2K[x] );
            XML_data2.NodeValue := sb.F_Audio15LevelRange;
        end;

        Inc( x );

        if True = sb.E_Audio16LevelRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2K[x] );
            XML_data2.NodeValue := sb.F_Audio16LevelRange;
        end;
    end;
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbEditDstLevelDefineLoad( cnl : IXMLNodeList );
var
    j : integer;
    str, txt : string;
    u : TSbEditdstLevelDefine;

begin

    u := TSbEditdstLevelDefine.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl_2K ) of
        0:  begin u.F_Id                    := txt;     u.E_Id                      := True;    end;
        1:  begin u.F_EditPortRanges        := txt;     u.E_EditPortRanges          := True;    end;
        2:  begin u.F_VideoTargetPortRanges := txt;     u.E_VideoTargetPortRanges   := True;    end;
        3:  begin u.F_AudioTargetPortRanges := txt;     u.E_AudioTargetPortRanges   := True;    end;
        4:  begin u.F_VideoLevelRange       := txt;     u.E_VideoLevelRange         := True;    end;
        5:  begin u.F_Audio1LevelRange      := txt;     u.E_Audio1LevelRange        := True;    end;
        6:  begin u.F_Audio2LevelRange      := txt;     u.E_Audio2LevelRange        := True;    end;
        7:  begin u.F_Audio3LevelRange      := txt;     u.E_Audio3LevelRange        := True;    end;
        8:  begin u.F_Audio4LevelRange      := txt;     u.E_Audio4LevelRange        := True;    end;
        9:  begin u.F_Audio5LevelRange      := txt;     u.E_Audio5LevelRange        := True;    end;
        10: begin u.F_Audio6LevelRange      := txt;     u.E_Audio6LevelRange        := True;    end;
        11: begin u.F_Audio7LevelRange      := txt;     u.E_Audio7LevelRange        := True;    end;
        12: begin u.F_Audio8LevelRange      := txt;     u.E_Audio8LevelRange        := True;    end;
        13: begin u.F_Audio9LevelRange      := txt;     u.E_Audio9LevelRange        := True;    end;
        14: begin u.F_Audio10LevelRange     := txt;     u.E_Audio10LevelRange       := True;    end;
        15: begin u.F_Audio11LevelRange     := txt;     u.E_Audio11LevelRange       := True;    end;
        16: begin u.F_Audio12LevelRange     := txt;     u.E_Audio12LevelRange       := True;    end;
        17: begin u.F_Audio13LevelRange     := txt;     u.E_Audio13LevelRange       := True;    end;
        18: begin u.F_Audio14LevelRange     := txt;     u.E_Audio14LevelRange       := True;    end;
        19: begin u.F_Audio15LevelRange     := txt;     u.E_Audio15LevelRange       := True;    end;
        20: begin u.F_Audio16LevelRange     := txt;     u.E_Audio16LevelRange       := True;    end;
        else
            begin
                _beep;
            end;
        end;

    end;

    FSbEditDstLevelDefineList.Add( u );
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbEditDstLevelDefineSave( XML_Doc : IXMLDocument );
var
	XML_rs    	: IXMLNode;
	XML_data2   : IXMLNode;
    x, i : integer;
    sb : TSbEditDstLevelDefine;

begin

    for i:=0 to FSbEditDstLevelDefineList.Count-1 do begin

        XML_rs := XML_Doc.DocumentElement.AddChild( 'SbEditDstLevelDefine' );

        sb  := FSbEditDstLevelDefineList.Data[i];
        x   := 0;

        if True = sb.E_Id then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2K[x] );
            XML_data2.NodeValue := sb.F_Id;
        end;

        Inc( x );

        if True = sb.E_EditPortRanges then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2K[x] );
            XML_data2.NodeValue := sb.F_EditPortRanges;
        end;

        Inc( x );

        if True = sb.E_VideoTargetPortRanges then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2K[x] );
            XML_data2.NodeValue := sb.F_VideoTargetPortRanges;
        end;

        Inc( x );

        if True = sb.E_AudioTargetPortRanges then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2K[x] );
            XML_data2.NodeValue := sb.F_AudioTargetPortRanges;
        end;

        Inc( x );

        if True = sb.E_VideoLevelRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2K[x] );
            XML_data2.NodeValue := sb.F_VideoLevelRange;
        end;

        Inc( x );

        if True = sb.E_Audio1LevelRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2K[x] );
            XML_data2.NodeValue := sb.F_Audio1LevelRange;
        end;

        Inc( x );

        if True = sb.E_Audio2LevelRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2K[x] );
            XML_data2.NodeValue := sb.F_Audio2LevelRange;
        end;

        Inc( x );

        if True = sb.E_Audio3LevelRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2K[x] );
            XML_data2.NodeValue := sb.F_Audio3LevelRange;
        end;

        Inc( x );

        if True = sb.E_Audio4LevelRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2K[x] );
            XML_data2.NodeValue := sb.F_Audio4LevelRange;
        end;

        Inc( x );

        if True = sb.E_Audio5LevelRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2K[x] );
            XML_data2.NodeValue := sb.F_Audio5LevelRange;
        end;

        Inc( x );

        if True = sb.E_Audio6LevelRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2K[x] );
            XML_data2.NodeValue := sb.F_Audio6LevelRange;
        end;

        Inc( x );

        if True = sb.E_Audio7LevelRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2K[x] );
            XML_data2.NodeValue := sb.F_Audio7LevelRange;
        end;

        Inc( x );

        if True = sb.E_Audio8LevelRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2K[x] );
            XML_data2.NodeValue := sb.F_Audio8LevelRange;
        end;

        Inc( x );

        if True = sb.E_Audio9LevelRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2K[x] );
            XML_data2.NodeValue := sb.F_Audio9LevelRange;
        end;

        Inc( x );

        if True = sb.E_Audio10LevelRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2K[x] );
            XML_data2.NodeValue := sb.F_Audio10LevelRange;
        end;

        Inc( x );

        if True = sb.E_Audio11LevelRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2K[x] );
            XML_data2.NodeValue := sb.F_Audio11LevelRange;
        end;

        Inc( x );

        if True = sb.E_Audio12LevelRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2K[x] );
            XML_data2.NodeValue := sb.F_Audio12LevelRange;
        end;

        Inc( x );

        if True = sb.E_Audio13LevelRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2K[x] );
            XML_data2.NodeValue := sb.F_Audio13LevelRange;
        end;

        Inc( x );

        if True = sb.E_Audio14LevelRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2K[x] );
            XML_data2.NodeValue := sb.F_Audio14LevelRange;
        end;

        Inc( x );

        if True = sb.E_Audio15LevelRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2K[x] );
            XML_data2.NodeValue := sb.F_Audio15LevelRange;
        end;

        Inc( x );

        if True = sb.E_Audio16LevelRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2K[x] );
            XML_data2.NodeValue := sb.F_Audio16LevelRange;
        end;
    end;
end;

const
    tbl_2L : array [0..8] of string = (
        'F_Id',
        'F_Name',
        'F_Order',
        'F_DisplayName',
        'F_SrcPortNoRange',
        'F_DefaultProgramId',
        'F_DefaultProgramRowHeaderDisplayName',
        'F_DefaultProgramTitleDisplayName',
        'F_Note'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbSystemModeLoad( cnl : IXMLNodeList );
var
    j : integer;
    str, txt : string;
    u : TSbSystemMode;

begin

    u := TSbSystemMode.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl_2L ) of
        0:  begin u.F_Id                := txt;     u.E_Id                := True;  end;
        1:  begin u.F_Name              := txt;     u.E_Name              := True;  end;
        2:  begin u.F_Order             := txt;     u.E_Order             := True;  end;
        3:  begin u.F_DisplayName       := txt;     u.E_DisplayName       := True;  end;
        4:  begin u.F_SrcPortNoRange    := txt;     u.E_SrcPortNoRange    := True;  end;
        5:  begin u.F_DefaultProgramId  := txt;     u.E_DefaultProgramId  := True;  end;
        6:  begin u.F_DefaultProgramRowHeaderDisplayName    := txt;     u.E_DefaultProgramRowHeaderDisplayName    := True;  end;
        7:  begin u.F_DefaultProgramTitleDisplayName        := txt;     u.E_DefaultProgramTitleDisplayName        := True;  end;
        8:  begin u.F_Note              := txt;     u.E_Note              := True;  end;
        else
            begin
                _beep;
            end;
        end;

    end;

    FSbSystemModeList.Add( u );
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbSystemModeSave( XML_Doc : IXMLDocument );
var
	XML_rs    	: IXMLNode;
	XML_data2   : IXMLNode;
    x, i : integer;
    sb : TSbSystemMode;

begin

    for i:=0 to FSbSystemModeList.Count-1 do begin

        XML_rs := XML_Doc.DocumentElement.AddChild( 'SbSystemMode' );

        sb  := FSbSystemModeList.Data[i];
        x   := 0;

        if True = sb.E_Id then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2L[x] );
            XML_data2.NodeValue := sb.F_Id;
        end;

        Inc( x );

        if True = sb.E_Name then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2L[x] );
            XML_data2.NodeValue := sb.F_Name;
        end;

        Inc( x );

        if True = sb.E_Order then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2L[x] );
            XML_data2.NodeValue := sb.F_Order;
        end;

        Inc( x );

        if True = sb.E_DisplayName then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2L[x] );
            XML_data2.NodeValue := sb.F_DisplayName;
        end;

        Inc( x );

        if True = sb.E_SrcPortNoRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2L[x] );
            XML_data2.NodeValue := sb.F_SrcPortNoRange;
        end;

        Inc( x );

        if True = sb.E_DefaultProgramId then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2L[x] );
            XML_data2.NodeValue := sb.F_DefaultProgramId;
        end;

        Inc( x );

        if True = sb.E_DefaultProgramRowHeaderDisplayName then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2L[x] );
            XML_data2.NodeValue := sb.F_DefaultProgramRowHeaderDisplayName;
        end;

        Inc( x );

        if True = sb.E_DefaultProgramTitleDisplayName then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2L[x] );
            XML_data2.NodeValue := sb.F_DefaultProgramTitleDisplayName;
        end;

        Inc( x );

        if True = sb.E_Note then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2L[x] );
            XML_data2.NodeValue := sb.F_Note;
        end;

    end;
end;

const
    tbl_2M : array [0..3] of string = (
        'F_DstNo',
        'F_DivDstLevel',
        'F_DivDstNoRange',
        'F_Note'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbMultiLevelDstLoad( cnl : IXMLNodeList );
var
    j : integer;
    str, txt : string;
    u : TSbMultiLevelDst;

begin

    u := TSbMultiLevelDst.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl_2M ) of
        0:  begin u.F_DstNo         := txt;     u.E_DstNo         := True;  end;
        1:  begin u.F_DivDstLevel   := txt;     u.E_DivDstLevel   := True;  end;
        2:  begin u.F_DivDstNoRange := txt;     u.E_DivDstNoRange := True;  end;
        3:  begin u.F_Note          := txt;     u.E_Note          := True;  end;
        else
            begin
                _beep;
            end;
        end;

    end;

    FSbMultiLevelDstList.Add( u );
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbMultiLevelDstSave( XML_Doc : IXMLDocument );
var
	XML_rs    	: IXMLNode;
	XML_data2   : IXMLNode;
    x, i : integer;
    sb : TSbMultiLevelDst;

begin

    for i:=0 to FSbMultiLevelDstList.Count-1 do begin

        XML_rs := XML_Doc.DocumentElement.AddChild( 'SbMultiLevelDst' );

        sb  := FSbMultiLevelDstList.Data[i];
        x   := 0;

        if True = sb.E_DstNo then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2M[x] );
            XML_data2.NodeValue := sb.F_DstNo;
        end;

        Inc( x );

        if True = sb.E_DivDstLevel then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2M[x] );
            XML_data2.NodeValue := sb.F_DivDstLevel;
        end;

        Inc( x );

        if True = sb.E_DivDstNoRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2M[x] );
            XML_data2.NodeValue := sb.F_DivDstNoRange;
        end;

        Inc( x );

        if True = sb.E_Note then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2M[x] );
            XML_data2.NodeValue := sb.F_Note;
        end;
    end;
end;

const
    tbl_2N : array [0..2] of string = (
        'F_SrcNo',
        'F_DivSrcNoRange',
        'F_Note'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbMultiLevelSrcLoad( cnl : IXMLNodeList );
var
    j : integer;
    str, txt : string;
    u : TSbMultiLevelSrc;

begin

    u := TSbMultiLevelSrc.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl_2N ) of
        0:  begin u.F_SrcNo         := txt;     u.E_SrcNo         := True;  end;
        1:  begin u.F_DivSrcNoRange := txt;     u.E_DivSrcNoRange := True;  end;
        2:  begin u.F_Note          := txt;     u.E_Note          := True;  end;
        else
            begin
                _beep;
            end;
        end;

    end;

    FSbMultiLevelSrcList.Add( u );

end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TSBusDb.SbMultiLevelSrcSave( XML_Doc : IXMLDocument );
var
	XML_rs    	: IXMLNode;
	XML_data2   : IXMLNode;
    x, i : integer;
    sb : TSbMultiLevelSrc;

begin

    for i:=0 to FSbMultiLevelSrcList.Count-1 do begin

        XML_rs := XML_Doc.DocumentElement.AddChild( 'SbMultiLevelSrc' );

        sb  := FSbMultiLevelSrcList.Data[i];
        x   := 0;

        if True = sb.E_SrcNo then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2N[x] );
            XML_data2.NodeValue := sb.F_SrcNo;
        end;

        Inc( x );

        if True = sb.E_DivSrcNoRange then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2N[x] );
            XML_data2.NodeValue := sb.F_DivSrcNoRange;
        end;

        Inc( x );

        if True = sb.E_Note then begin
            XML_data2 			:= XML_rs.AddChild( tbl_2N[x] );
            XML_data2.NodeValue := sb.F_Note;
        end;
    end;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbDevice.Create;
begin
    inherited;

    F_Id                    := '';
    E_Id                    := False;
    F_StationId             := '';
    E_StationId             := False;
    F_TypeName              := '';
    E_TypeName              := False;
    F_Name                  := '';
    E_Name                  := False;
    F_IpAddress             := '';
    E_IpAddress             := False;
    F_TimeoutMsec           := '';
    E_TimeoutMsec           := False;
    F_IsSendTarget          := '';
    E_IsSendTarget          := False;
    F_IsRecvTarget          := '';
    E_IsRecvTarget          := False;
    F_IsKeyAssign           := '';
    E_IsKeyAssign           := False;
    F_KeyAssignPageCount    := '';
    E_KeyAssignPageCount    := False;
    F_IsEditLocked          := '';
    E_IsEditLocked          := False;
    F_DeviceCategoryName    := '';
    E_DeviceCategoryName    := False;
    F_IsNsbusDevice         := '';
    E_IsNsbusDevice         := False;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbDevice.Destroy;
begin
    inherited;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbDeviceList.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbDeviceList.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TSbDeviceList.GetData( index : integer ) : TSbDevice;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TSbDevice( Items[ index ] );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSbDeviceList.ClearAll;
var
    d : TSbDevice;

begin
    while True do begin
        d := Data[0];
        if nil = d then break;

        Extract( d );
        d.Free;
    end;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TSbDeviceList.SearchStationId( id : string ) : TSbDevice;
var
    d : TSbDevice;
    i : integer;

begin
    for i:=0 to COunt-1 do begin
        d := Data[i];
        if d.F_StationId = id then begin
            Result := d;
            Exit;
        end;
    end;

    Result := nil;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbPanelType.Create;
begin
    inherited;

    F_Id                        := '';
    E_Id                        := False;
    F_Name                      := '';
    E_Name                      := False;
    F_Note                      := '';
    E_Note                      := False;
    F_UiKey                     := '';
    E_UiKey                     := False;
    F_PageCount                 := '';
    E_PageCount                 := False;
    F_HasBusNameLabel           := '';
    E_HasBusNameLabel           := False;
    F_KeyCount                  := '';
    E_KeyCount                  := False;
    F_HasControlDst             := '';
    E_HasControlDst             := False;
    F_CanCdsAssign              := '';
    E_CanCdsAssign              := False;
    F_CanSrcAssign              := '';
    E_CanSrcAssign              := False;
    F_CanDstAssign              := '';
    E_CanDstAssign              := False;
    F_CanFncAssign              := '';
    E_CanFncAssign              := False;
    F_AssignCancelSrcDstGpSel   := '';
    E_AssignCancelSrcDstGpSel   := False;
    F_CdsStartBytes             := '';
    E_CdsStartBytes             := False;
    F_CdsPageByteCount          := '';
    E_CdsPageByteCount          := False;
    F_CdsIsLitteEndian          := '';
    E_CdsIsLitteEndian          := False;
    F_SrcStartBytes             := '';
    E_SrcStartBytes             := False;
    F_SrcPageByteCount          := '';
    E_SrcPageByteCount          := False;
    F_DstStartBytes             := '';
    E_DstStartBytes             := False;
    F_DstPageByteCount          := '';
    E_DstPageByteCount          := False;
    F_IsCdstAutoAssign          := '';
    E_IsCdstAutoAssign          := False;
    F_CanPageCountSetting       := '';
    E_CanPageCountSetting       := False;
    F_CanDstAssignEachPages     := '';
    E_CanDstAssignEachPages     := False;
    F_AvailablePageStartBytes   := '';
    E_AvailablePageStartBytes   := False;

    F_SrcDstAreaZeroClearDisabled := '';
    E_SrcDstAreaZeroClearDisabled := False;
    F_IsSrcDstBothPanel           := '';
    E_IsSrcDstBothPanel           := False;
    F_IsManualInputModeSupported  := '';
    E_IsManualInputModeSupported  := False;
    F_IsOpeMdEnabled              := '';
    E_IsOpeMdEnabled              := False;
    F_IsOpeBpsEnabled             := '';
    E_IsOpeBpsEnabled             := False;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbPanelType.Destroy;
begin
    inherited;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbPanelTypeList.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbPanelTypeList.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TSbPanelTypeList.GetData( index : integer ) : TSbPanelType;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TSbPanelType( Items[ index ] );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSbPanelTypeList.ClearAll;
var
    d : TSbPanelType;

begin
    while True do begin
        d := Data[0];
        if nil = d then break;

        Extract( d );
        d.Free;
    end;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TSbPanelTypeList.Search( id : string ) : TSbPanelType;
var
    i : integer;
    d : TSbPanelType;

begin
    for i:=0 to Count-1 do begin
        d := Data[i];
        if (d.E_Id = True) and (d.F_Id = id) then begin
            Result := d;
            Exit;
        end;
    end;

    Result := nil;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbDeviceType.Create;
begin
    inherited;

    F_Id                        := '';
    E_Id                        := False;
    F_Name                      := '';
    E_Name                      := False;
    F_PanelTypeId               := '';
    E_PanelTypeId               := False;
    F_IsSubnetControllable      := '';
    E_IsSubnetControllable      := False;
    F_IsSoapSupported           := '';
    E_IsSoapSupported           := False;
    F_IsNsBusDevice             := '';
    E_IsNsBusDevice             := False;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbDeviceType.Destroy;
begin
    inherited;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbDeviceTypeList.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbDeviceTypeList.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TSbDeviceTypeList.GetData( index : integer ) : TSbDeviceType;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TSbDeviceType( Items[ index ] );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSbDeviceTypeList.ClearAll;
var
    d : TSbDeviceType;

begin
    while True do begin
        d := Data[0];
        if nil = d then break;

        Extract( d );
        d.Free;
    end;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TSbDeviceTypeList.GetPanelTypeId( dtype : string ) : string;
var
    d : TSbDeviceType;
    i : integer;

begin
    for i:=0 to Count-1 do begin
        d := Data[i];
        if False = d.E_PanelTypeId then continue;
        if dtype <> d.F_Name then continue;

        Result := d.F_PanelTypeId;
        Exit;
    end;

    Result := '';
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TSbDeviceTypeList.SearchPanelTypeId( id : string ) : TSbDeviceType;
var
    d : TSbDeviceType;
    i : integer;

begin
    for i:=0 to Count-1 do begin
        d := Data[i];
        if False = d.E_PanelTypeId then continue;
        if id <> d.F_PanelTypeId then continue;

        Result := d;
        Exit;
    end;

    Result := nil;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbXptBus.Create;
begin
    inherited;

    F_Id                := '';
    E_Id                := False;
    F_Name              := '';
    E_Name              := False;
    F_Text              := '';
    E_Text              := False;
    F_RecvLevelNo       := '';
    E_RecvLevelNo       := False;
    F_SendLevelBitMask  := '';
    E_SendLevelBitMask  := False;
    F_SendLevelBitMaskOffLine       := '';
    E_SendLevelBitMaskOffLine       := False;
    F_DstPortNoRange    := '';
    E_DstPortNoRange    := False;
    F_SrcPortNoRange    := '';
    E_SrcPortNoRange    := False;
    F_NoAssignDstNo     := '';
    E_NoAssignDstNo     := False;
    F_NoAssignSrcNo     := '';
    E_NoAssignSrcNo     := False;
    F_IsVirtual         := '';
    E_IsVirtual         := False;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbXptBus.Destroy;
begin
    inherited;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbXptBusList.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbXptBusList.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TSbXptBusList.GetData( index : integer ) : TSbXptBus;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TSbXptBus( Items[ index ] );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSbXptBusList.ClearAll;
var
    d : TSbXptBus;

begin
    while True do begin
        d := Data[0];
        if nil = d then break;

        Extract( d );
        d.Free;
    end;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbSrcNameBus.Create;
begin
    inherited;

    F_Id                    := '';
    E_Id                    := False;
    F_Name                  := '';
    E_Name                  := False;
    F_AliasNo               := '';
    E_AliasNo               := False;
    F_SrcPortNoRange        := '';
    E_SrcPortNoRange        := False;
    F_IsProgramSendTarget   := '';
    E_IsProgramSendTarget   := False;
    F_Note                  := '';
    E_Note                  := False;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbSrcNameBus.Destroy;
begin
    inherited;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbSrcNameBusList.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbSrcNameBusList.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TSbSrcNameBusList.GetData( index : integer ) : TSbSrcNameBus;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TSbSrcNameBus( Items[ index ] );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSbSrcNameBusList.ClearAll;
var
    d : TSbSrcNameBus;

begin
    while True do begin
        d := Data[0];
        if nil = d then break;

        Extract( d );
        d.Free;
    end;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TSbSrcNameBusList.SearchName( nm : string ) : TSbSrcNameBus;
var
    d : TSbSrcNameBus;
    i : integer;

begin
    for i:=0 to Count-1 do begin
        d := Data[i];

        if ('F_' + d.F_Name) = nm then begin
            Result := d;
            Exit;
        end;
    end;

    Result := nil;
end;


//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbSrcNameGroup.Create;
begin
    inherited;

    F_Id                    := '';
    E_Id                    := False;
    F_Name                  := '';
    E_Name                  := False;
    F_SrcPortNoRange        := '';
    E_SrcPortNoRange        := False;
    F_Note                  := '';
    E_Note                  := False;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbSrcNameGroup.Destroy;
begin
    inherited;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbSrcNameGroupList.Create;
begin
    inherited;


end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbSrcNameGroupList.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TSbSrcNameGroupList.GetData( index : integer ) : TSbSrcNameGroup;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TSbSrcNameGroup( Items[ index ] );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSbSrcNameGroupList.ClearAll;
var
    d : TSbSrcNameGroup;

begin
    while True do begin
        d := Data[0];
        if nil = d then break;

        Extract( d );
        d.Free;
    end;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbDstNameGroup.Create;
begin
    inherited;

    F_Id                    := '';
    E_Id                    := False;
    F_Name                  := '';
    E_Name                  := False;
    F_DstPortNoRange        := '';
    E_DstPortNoRange        := False;
    F_Note                  := '';
    E_Note                  := False;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbDstNameGroup.Destroy;
begin
    inherited;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbDstNameGroupList.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbDstNameGroupList.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TSbDstNameGroupList.GetData( index : integer ) : TSbDstNameGroup;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TSbDstNameGroup( Items[ index ] );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSbDstNameGroupList.ClearAll;
var
    d : TSbDstNameGroup;

begin
    while True do begin
        d := Data[0];
        if nil = d then break;

        Extract( d );
        d.Free;
    end;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbDstNameBus.Create;
begin
    inherited;

    F_Id                    := '';
    E_Id                    := False;
    F_Name                  := '';
    E_Name                  := False;
    F_AliasNo               := '';
    E_AliasNo               := False;
    F_DstPortNoRange        := '';
    E_DstPortNoRange        := False;
    F_IsProgramSendTarget   := '';
    E_IsProgramSendTarget   := False;
    F_Note                  := '';
    E_Note                  := False;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbDstNameBus.Destroy;
begin
    inherited;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbDstNameBusList.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbDstNameBusList.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TSbDstNameBusList.GetData( index : integer ) : TSbDstNameBus;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TSbDstNameBus( Items[ index ] );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSbDstNameBusList.ClearAll;
var
    d : TSbDstNameBus;

begin
    while True do begin
        d := Data[0];
        if nil = d then break;

        Extract( d );
        d.Free;
    end;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TSbDstNameBusList.SearchName( nm : string ) : TSbDstNameBus;
var
    d : TSbDstNameBus;
    i : integer;

begin
    for i:=0 to Count-1 do begin
        d := Data[i];

        if ('F_' + d.F_Name) = nm then begin
            Result := d;
            Exit;
        end;
    end;

    Result := nil;
end;


//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbDstInhibit.Create;
begin
    inherited;

    F_DstPortNo             := '';
    E_DstPortNo             := False;
    F_IsInhibit             := '';
    E_IsInhibit             := False;
    F_IsReadOnly            := '';
    E_IsReadOnly            := False;
    F_XptCategor            := '';
    E_XptCategor            := False;
end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbDstInhibit.Destroy;
begin
    inherited;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbDstInhibitList.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbDstInhibitList.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TSbDstInhibitList.GetData( index : integer ) : TSbDstInhibit;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TSbDstInhibit( Items[ index ] );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSbDstInhibitList.ClearAll;
var
    d : TSbDstInhibit;

begin
    while True do begin
        d := Data[0];
        if nil = d then break;

        Extract( d );
        d.Free;
    end;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbAlarmDefine.Create;
begin
    inherited;

    F_AlarmCode             := '';
    E_AlarmCode             := False;
    F_Level                 := '';
    E_Level                 := False;
    F_Message               := '';
    E_Message               := False;
    F_IsRecoverable         := '';
    E_IsRecoverable         := False;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbAlarmDefine.Destroy;
begin
    inherited;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbAlarmDefineList.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbAlarmDefineList.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TSbAlarmDefineList.GetData( index : integer ) : TSbAlarmDefine;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TSbAlarmDefine( Items[ index ] );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSbAlarmDefineList.ClearAll;
var
    d : TSbAlarmDefine;

begin
    while True do begin
        d := Data[0];
        if nil = d then break;

        Extract( d );
        d.Free;
    end;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbPanelPageName.Create;
begin
    inherited;

    F_Id                := '';
    E_Id                := False;
    F_PanelTypeId       := '';
    E_PanelTypeId       := False;
    F_PageNo            := '';
    E_PageNo            := False;
    F_PageName          := '';
    E_PageName          := False;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbPanelPageName.Destroy;
begin
    inherited;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbPanelPageNameList.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbPanelPageNameList.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TSbPanelPageNameList.GetData( index : integer ) : TSbPanelPageName;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TSbPanelPageName( Items[ index ] );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSbPanelPageNameList.ClearAll;
var
    d : TSbPanelPageName;

begin
    while True do begin
        d := Data[0];
        if nil = d then break;

        Extract( d );
        d.Free;
    end;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbDevicePanelPageName.Create;
begin
    inherited;

    F_DeviceId          := '';
    E_DeviceId          := False;
    F_PageNo            := '';
    E_PageNo            := False;
    F_PageName          := '';
    E_PageName          := False;
    F_DisplayOrder      := '';
    E_DisplayOrder      := False;
    F_IsVisible         := '';
    E_IsVisible         := False;
end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbDevicePanelPageName.Destroy;
begin
    inherited;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbDevicePanelPageNameList.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbDevicePanelPageNameList.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TSbDevicePanelPageNameList.GetData( index : integer ) : TSbDevicePanelPageName;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TSbDevicePanelPageName( Items[ index ] );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSbDevicePanelPageNameList.ClearAll;
var
    d : TSbDevicePanelPageName;

begin
    while True do begin
        d := Data[0];
        if nil = d then break;

        Extract( d );
        d.Free;
    end;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbSrcColor.Create;
begin
    inherited;

    F_Id                        := '';
    E_Id                        := False;
    F_ScreenRgba                := '';
    E_ScreenRgba                := False;
    F_ScreenTextRgba            := '';
    E_ScreenTextRgba            := False;
    F_ScreenSelectedRgba        := '';
    E_ScreenSelectedRgba        := False;
    F_ScreenTextSelectedRgba    := '';
    E_ScreenTextSelectedRgba    := False;
    F_AliasText                 := '';
    E_AliasText                 := False;
    F_DisplayName               := '';
    E_DisplayName               := False;
end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbSrcColor.Destroy;
begin
    inherited;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbSrcColorList.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbSrcColorList.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TSbSrcColorList.GetData( index : integer ) : TSbSrcColor;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TSbSrcColor( Items[ index ] );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSbSrcColorList.ClearAll;
var
    d : TSbSrcColor;

begin
    while True do begin
        d := Data[0];
        if nil = d then break;

        Extract( d );
        d.Free;
    end;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbDstControlTarget.Create;
begin
    inherited;

    F_DstPortNo     := '';
    E_DstPortNo     := False;
    F_IsSbusTarget  := '';
    E_IsSbusTarget  := False;
    F_IsNsBusTarget := '';
    E_IsNsBusTarget := False;
end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbDstControlTarget.Destroy;
begin
    inherited;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbDstControlTargetList.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbDstControlTargetList.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TSbDstControlTargetList.GetData( index : integer ) : TSbDstControlTarget;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TSbDstControlTarget( Items[ index ] );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSbDstControlTargetList.ClearAll;
var
    d : TSbDstControlTarget;

begin
    while True do begin
        d := Data[0];
        if nil = d then break;

        Extract( d );
        d.Free;
    end;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbEditSrcSetGroup.Create;
begin
    inherited;

    F_SrcNo             := '';
    E_SrcNo             := False;
    F_LevelDefineId     := '';
    E_LevelDefineId     := False;
    F_GroupName         := '';
    E_GroupName         := False;
    F_ChCount           := '';
    E_ChCount           := False;
end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbEditSrcSetGroup.Destroy;
begin
    inherited;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbEditSrcSetGroupList.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbEditSrcSetGroupList.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TSbEditSrcSetGroupList.GetData( index : integer ) : TSbEditSrcSetGroup;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TSbEditSrcSetGroup( Items[ index ] );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSbEditSrcSetGroupList.ClearAll;
var
    d : TSbEditSrcSetGroup;

begin
    while True do begin
        d := Data[0];
        if nil = d then break;

        Extract( d );
        d.Free;
    end;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbEditDstSetGroup.Create;
begin
    inherited;

    F_DstNo             := '';
    E_DstNo             := False;
    F_LevelDefineId     := '';
    E_LevelDefineId     := False;
    F_GroupName         := '';
    E_GroupName         := False;
    F_ChCount           := '';
    E_ChCount           := False;
end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbEditDstSetGroup.Destroy;
begin
    inherited;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbEditDstSetGroupList.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbEditDstSetGroupList.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TSbEditDstSetGroupList.GetData( index : integer ) : TSbEditDstSetGroup;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TSbEditDstSetGroup( Items[ index ] );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSbEditDstSetGroupList.ClearAll;
var
    d : TSbEditDstSetGroup;

begin
    while True do begin
        d := Data[0];
        if nil = d then break;

        Extract( d );
        d.Free;
    end;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbEditSrcLevelDefine.Create;
begin
    inherited;

    F_Id                        := '';
    E_Id                        := False;
    F_EditPortRanges            := '';
    E_EditPortRanges            := False;
    F_VideoTargetPortRanges     := '';
    E_VideoTargetPortRanges     := False;
    F_VideoLevelRange           := '';
    E_VideoLevelRange           := False;
    F_AudioTargetPortRanges     := '';
    E_AudioTargetPortRanges     := False;
    F_Audio1LevelRange          := '';
    E_Audio1LevelRange          := False;
    F_Audio2LevelRange          := '';
    E_Audio2LevelRange          := False;
    F_Audio3LevelRange          := '';
    E_Audio3LevelRange          := False;
    F_Audio4LevelRange          := '';
    E_Audio4LevelRange          := False;
    F_Audio5LevelRange          := '';
    E_Audio5LevelRange          := False;
    F_Audio6LevelRange          := '';
    E_Audio6LevelRange          := False;
    F_Audio7LevelRange          := '';
    E_Audio7LevelRange          := False;
    F_Audio8LevelRange          := '';
    E_Audio8LevelRange          := False;
    F_Audio9LevelRange          := '';
    E_Audio9LevelRange          := False;
    F_Audio10LevelRange         := '';
    E_Audio10LevelRange         := False;
    F_Audio11LevelRange         := '';
    E_Audio11LevelRange         := False;
    F_Audio12LevelRange         := '';
    E_Audio12LevelRange         := False;
    F_Audio13LevelRange         := '';
    E_Audio13LevelRange         := False;
    F_Audio14LevelRange         := '';
    E_Audio14LevelRange         := False;
    F_Audio15LevelRange         := '';
    E_Audio15LevelRange         := False;
    F_Audio16LevelRange         := '';
    E_Audio16LevelRange         := False;
end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbEditSrcLevelDefine.Destroy;
begin
    inherited;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbEditSrcLevelDefineList.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbEditSrcLevelDefineList.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TSbEditSrcLevelDefineList.GetData( index : integer ) : TSbEditSrcLevelDefine;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TSbEditSrcLevelDefine( Items[ index ] );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSbEditSrcLevelDefineList.ClearAll;
var
    d : TSbEditSrcLevelDefine;

begin
    while True do begin
        d := Data[0];
        if nil = d then break;

        Extract( d );
        d.Free;
    end;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbEditDstLevelDefine.Create;
begin
    inherited;

    F_Id                        := '';
    E_Id                        := False;
    F_EditPortRanges            := '';
    E_EditPortRanges            := False;
    F_VideoTargetPortRanges     := '';
    E_VideoTargetPortRanges     := False;
    F_VideoLevelRange           := '';
    E_VideoLevelRange           := False;
    F_AudioTargetPortRanges     := '';
    E_AudioTargetPortRanges     := False;
    F_Audio1LevelRange          := '';
    E_Audio1LevelRange          := False;
    F_Audio2LevelRange          := '';
    E_Audio2LevelRange          := False;
    F_Audio3LevelRange          := '';
    E_Audio3LevelRange          := False;
    F_Audio4LevelRange          := '';
    E_Audio4LevelRange          := False;
    F_Audio5LevelRange          := '';
    E_Audio5LevelRange          := False;
    F_Audio6LevelRange          := '';
    E_Audio6LevelRange          := False;
    F_Audio7LevelRange          := '';
    E_Audio7LevelRange          := False;
    F_Audio8LevelRange          := '';
    E_Audio8LevelRange          := False;
    F_Audio9LevelRange          := '';
    E_Audio9LevelRange          := False;
    F_Audio10LevelRange         := '';
    E_Audio10LevelRange         := False;
    F_Audio11LevelRange         := '';
    E_Audio11LevelRange         := False;
    F_Audio12LevelRange         := '';
    E_Audio12LevelRange         := False;
    F_Audio13LevelRange         := '';
    E_Audio13LevelRange         := False;
    F_Audio14LevelRange         := '';
    E_Audio14LevelRange         := False;
    F_Audio15LevelRange         := '';
    E_Audio15LevelRange         := False;
    F_Audio16LevelRange         := '';
    E_Audio16LevelRange         := False;
end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbEditDstLevelDefine.Destroy;
begin
    inherited;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbEditDstLevelDefineList.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbEditDstLevelDefineList.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TSbEditDstLevelDefineList.GetData( index : integer ) : TSbEditDstLevelDefine;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TSbEditDstLevelDefine( Items[ index ] );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSbEditDstLevelDefineList.ClearAll;
var
    d : TSbEditDstLevelDefine;

begin
    while True do begin
        d := Data[0];
        if nil = d then break;

        Extract( d );
        d.Free;
    end;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbSystemMode.Create;
begin
    inherited;

    F_Id                := '';
    E_Id                := False;
    F_Name              := '';
    E_Name              := False;
    F_Order             := '';
    E_Order             := False;
    F_DisplayName       := '';
    E_DisplayName       := False;
    F_SrcPortNoRange    := '';
    E_SrcPortNoRange    := False;
    F_DefaultProgramId  := '';
    E_DefaultProgramId  := False;
    F_DefaultProgramRowHeaderDisplayName    := '';
    E_DefaultProgramRowHeaderDisplayName    := False;
    F_DefaultProgramTitleDisplayName        := '';
    E_DefaultProgramTitleDisplayName        := False;
    F_Note              := '';
    E_Note              := False;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbSystemMode.Destroy;
begin
    inherited;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbSystemModeList.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbSystemModeList.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TSbSystemModeList.GetData( index : integer ) : TSbSystemMode;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TSbSystemMode( Items[ index ] );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSbSystemModeList.ClearAll;
var
    d : TSbSystemMode;

begin
    while True do begin
        d := Data[0];
        if nil = d then break;

        Extract( d );
        d.Free;
    end;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbMultiLevelDst.Create;
begin
    inherited;

    F_DstNo         := '';
    E_DstNo         := False;
    F_DivDstLevel   := '';
    E_DivDstLevel   := False;
    F_DivDstNoRange := '';
    E_DivDstNoRange := False;
    F_Note          := '';
    E_Note          := False;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbMultiLevelDst.Destroy;
begin
    inherited;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbMultiLevelDstList.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbMultiLevelDstList.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TSbMultiLevelDstList.GetData( index : integer ) : TSbMultiLevelDst;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TSbMultiLevelDst( Items[ index ] );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSbMultiLevelDstList.ClearAll;
var
    d : TSbMultiLevelDst;

begin
    while True do begin
        d := Data[0];
        if nil = d then break;

        Extract( d );
        d.Free;
    end;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbMultiLevelSrc.Create;
begin
    inherited;

    F_SrcNo         := '';
    E_SrcNo         := False;
    F_DivSrcNoRange := '';
    E_DivSrcNoRange := False;
    F_Note          := '';
    E_Note          := False;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbMultiLevelSrc.Destroy;
begin
    inherited;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbMultiLevelSrcList.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbMultiLevelSrcList.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TSbMultiLevelSrcList.GetData( index : integer ) : TSbMultiLevelSrc;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TSbMultiLevelSrc( Items[ index ] );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSbMultiLevelSrcList.ClearAll;
var
    d : TSbMultiLevelSrc;

begin
    while True do begin
        d := Data[0];
        if nil = d then break;

        Extract( d );
        d.Free;
    end;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbPanelFunctionKeyDefine.Create;
begin
    inherited;

    F_Id                    := '';
    E_Id                    := False;
    F_Text                  := '';
    E_Text                  := False;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbPanelFunctionKeyDefine.Destroy;
begin
    inherited;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbPanelFunctionKeyDefineList.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbPanelFunctionKeyDefineList.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TSbPanelFunctionKeyDefineList.GetData( index : integer ) : TSbPanelFunctionKeyDefine;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TSbPanelFunctionKeyDefine( Items[ index ] );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSbPanelFunctionKeyDefineList.ClearAll;
var
    d : TSbPanelFunctionKeyDefine;

begin
    while True do begin
        d := Data[0];
        if nil = d then break;

        Extract( d );
        d.Free;
    end;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbPanelFunctionKeyMapping.Create;
begin
    inherited;

    F_Id                    := '';
    E_Id                    := False;
    F_PanelTypeId           := '';
    E_PanelTypeId           := False;
    F_FunctionId            := '';
    E_FunctionId            := False;
    F_FunctionNo            := '';
    E_FunctionNo            := False;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbPanelFunctionKeyMapping.Destroy;
begin
    inherited;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbPanelFunctionKeyMappingList.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbPanelFunctionKeyMappingList.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TSbPanelFunctionKeyMappingList.GetData( index : integer ) : TSbPanelFunctionKeyMapping;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TSbPanelFunctionKeyMapping( Items[ index ] );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSbPanelFunctionKeyMappingList.ClearAll;
var
    d : TSbPanelFunctionKeyMapping;

begin
    while True do begin
        d := Data[0];
        if nil = d then break;

        Extract( d );
        d.Free;
    end;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbSettings.Create;
begin
    inherited;

    F_ValueId       := '';
    E_ValueId       := False;
    F_Value         := '';
    E_Value         := False;
end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbSettings.Destroy;
begin
    inherited;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TSbSettingsList.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TSbSettingsList.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TSbSettingsList.GetData( index : integer ) : TSbSettings;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TSbSettings( Items[ index ] );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TSbSettingsList.ClearAll;
var
    d : TSbSettings;

begin
    while True do begin
        d := Data[0];
        if nil = d then break;

        Extract( d );
        d.Free;
    end;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TProgramIndex.Create;
begin
    inherited;

    F_Id                := '';
    F_CategoryName      := '';
    F_CategoryName2     := '';
    F_CategoryName3     := '';
    F_ProgramName       := '';
    F_IsLocked          := '';
    F_CreatedDateTime   := '';
    F_UpdatedDateTime   := '';
    F_CategoryOrder     := '';
    F_CategoryOrder2    := '';
    F_CategoryOrder3    := '';
    F_ProgramMemo       := '';
    F_ProgramOrder      := '';
    F_SystemMode        := '';

    E_Id                := False;
    E_CategoryName      := False;
    E_CategoryName2     := False;
    E_CategoryName3     := False;
    E_ProgramName       := False;
    E_IsLocked          := False;
    E_CreatedDateTime   := False;
    E_UpdatedDateTime   := False;
    E_CategoryOrder     := False;
    E_CategoryOrder2    := False;
    E_CategoryOrder3    := False;
    E_ProgramMemo       := False;
    E_ProgramOrder      := False;
    E_SystemMode        := False;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TProgramIndex.Destroy;
begin
    inherited;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TPiCategory.Create;
begin
    inherited;

    F_Id                := '';
    F_CategoryName      := '';
    F_Order             := '';

    E_Id                := False;
    E_CategoryName      := False;
    E_Order             := False;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TPiCategory.Destroy;
begin
    inherited;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TProgramIndexList.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TProgramIndexList.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TProgramIndexList.GetData( index : integer ) : TProgramIndex;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TProgramIndex( Items[ index ] );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TProgramIndexList.ClearAll;
var
    d : TProgramIndex;

begin
    while True do begin
        d := Data[0];
        if nil = d then break;

        Extract( d );
        d.Free;
    end;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TPiCategoryList.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TPiCategoryList.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TPiCategoryList.GetData( index : integer ) : TPiCategory;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TPiCategory( Items[ index ] );
end;

//-----------------------------------------------------------------------------
//	話数の降順
//-----------------------------------------------------------------------------
function PiCategoryListSortOrder_Down( item1, item2 : Pointer ) : integer;
var
	n1, n2 : integer;

begin
    n1 	:= StrToIntDef( String( TPiCategory( item1 ).F_Order ), 0 );
    n2 	:= StrToIntDef( String( TPiCategory( item2 ).F_Order ), 0 );
	if n1 > n2 then 		Result := 1
	else if n1 < n2 then	Result := -1
    else                    Result := 0;
end;

//------------------------------------------------------------------------------
//  番組データ並び替え
//------------------------------------------------------------------------------
procedure TPiCategoryList.SortOrder;
begin
    Sort( @PiCategoryListSortOrder_Down );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TPiCategoryList.ClearAll;
var
    d : TPiCategory;

begin
    while True do begin
        d := Data[0];
        if nil = d then break;

        Extract( d );
        d.Free;
    end;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TPiCategoryList.GetMaxId : string;
var
    d : TPiCategory;
    max, i, m : integer;

begin
    max := -1;

    for i:=0 to Count-1 do begin

        d := Data[i];
        m := StrToIntDef( d.F_Id, 0 );

        if m > max then begin
            max := m;
        end;
    end;

    Result := IntToStr( max + 1 );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TPiCategoryList.GetMaxOrder : string;
var
    d : TPiCategory;
    max, i, m : integer;

begin
    max := -1;

    for i:=0 to Count-1 do begin

        d := Data[i];
        m := StrToIntDef( d.F_Order, 0 );

        if m > max then begin
            max := m;
        end;
    end;

    Result := IntToStr( max + 1 );
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TProgramIndexDb.Create;
var
    i : integer;

begin
    inherited;

    FProgramList    := TProgramIndexList.Create;

    for i:=0 to HIGH( FPiCategoryList ) do begin
        FPiCategoryList[i] := TPiCategoryList.Create;
    end;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TProgramIndexDb.Destroy;
var
    i : integer;

begin

    FProgramList.ClearAll;
    FProgramList.Free;

    for i:=0 to HIGH( FPiCategoryList ) do begin
        FPiCategoryList[i].ClearAll;
        FPiCategoryList[i].Free;
    end;

    inherited;

end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function TProgramIndexDb.GetPiCategoryList( cate : integer ) : TPiCategoryList;
begin
    Result := FPiCategoryList[ cate ];
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
const
    FProgIndexDbTable : array [0..3] of string = (
        'Program',
        'PiCategory',
        'PiCategory2',
        'PiCategory3'
    );

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TProgramIndexDb.Load( fn : string ) : Boolean;
var
    xml : IXMLDocument;
   	cnl, cnl0 : IXMLNodeList;
    j, n : integer;
	a : string;

begin
    Result := False;

    // ファイルなし
    if False = FileExists( fn ) then Exit;

    // XML読み込み
    xml	:= LoadXMLDocument( fn );

    // 'ProgramIndexDb'
    cnl0	:= xml.DocumentElement.ChildNodes;

    for j:=0 to cnl0.Count-1 do begin

        a    := cnl0.Nodes[j].NodeName;

        n := AnsiIndexStr( a, FProgIndexDbTable );
        if n = -1 then begin
//            Inc( count[ 1 ] );
            _beep;
            continue;
        end;

//        Inc( count[ n ] );

        cnl		:= cnl0.Nodes[j].ChildNodes;

        case n of
        0:  ProgramIndexLoad( cnl );
        1..3:
            PiCategoryLoad( cnl, n-1 );
        end;

    end;

{
    m := 0;
    for j:=0 to HIGH( count ) do begin
        m := m + count[j];
    end;
}
    Result := False;
end;


//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
const
    tbl_30  : array [0..13] of string = (
        'F_Id',
        'F_CategoryName',
        'F_CategoryName2',
        'F_CategoryName3',
        'F_ProgramName',
        'F_IsLocked',
        'F_CreatedDateTime',
        'F_UpdatedDateTime',
        'F_CategoryOrder',
        'F_CategoryOrder2',
        'F_CategoryOrder3',
        'F_ProgramMemo',
        'F_ProgramOrder',
        'F_SystemMode'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TProgramIndexDb.ProgramIndexLoad( cnl : IXMLNodeList );
var
    j : integer;
    str, txt : string;
    u : TProgramIndex;

begin

    u := TProgramIndex.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl_30 ) of
        0:  begin   u.F_Id                  := txt; u.E_Id              := True;    end;
        1:  begin   u.F_CategoryName        := txt; u.E_CategoryName    := True;    end;
        2:  begin   u.F_CategoryName2       := txt; u.E_CategoryName2   := True;    end;
        3:  begin   u.F_CategoryName3       := txt; u.E_CategoryName3   := True;    end;
        4:  begin   u.F_ProgramName         := txt; u.E_ProgramName     := True;    end;
        5:  begin   u.F_IsLocked            := txt; u.E_IsLocked        := True;    end;
        6:  begin   u.F_CreatedDateTime     := txt; u.E_CreatedDateTime := True;    end;
        7:  begin   u.F_UpdatedDateTime     := txt; u.E_UpdatedDateTime := True;    end;
        8:  begin   u.F_CategoryOrder       := txt; u.E_CategoryOrder   := True;    end;
        9:  begin   u.F_CategoryOrder2      := txt; u.E_CategoryOrder2  := True;    end;
        10: begin   u.F_CategoryOrder3      := txt; u.E_CategoryOrder3  := True;    end;
        11: begin   u.F_ProgramMemo         := txt; u.E_ProgramMemo     := True;    end;
        12: begin   u.F_ProgramOrder        := txt; u.E_ProgramOrder    := True;    end;
        13: begin   u.F_SystemMode          := txt; u.E_SystemMode      := True;    end;
        else
            begin
                _beep;
            end;
        end;
    end;

    FProgramList.Add( u );
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TProgramIndexDb.ProgramIndexSave( XML_Doc : IXMLDocument );   //; u : TProgramIndex );
var
	XML_rs    	: IXMLNode;
	XML_data2   : IXMLNode;
    i, x : integer;
    u : TProgramIndex;

begin

    for i:=0 to FProgramList.Count-1 do begin

        XML_rs := XML_Doc.DocumentElement.AddChild( FProgIndexDbTable[0] );

        u := FProgramList.Data[i];

        x := 0;

        if True = u.E_Id then begin
            XML_data2 			:= XML_rs.AddChild( tbl_30[x] );
            XML_data2.NodeValue := u.F_Id;
        end;

        Inc( x );

        if True = u.E_CategoryName then begin
            XML_data2 			:= XML_rs.AddChild( tbl_30[x] );
            XML_data2.NodeValue := u.F_CategoryName;
        end;

        Inc( x );

        if True = u.E_CategoryName2 then begin
            XML_data2 			:= XML_rs.AddChild( tbl_30[x] );
            XML_data2.NodeValue := u.F_CategoryName2;
        end;

        Inc( x );

        if True = u.E_CategoryName3 then begin
            XML_data2 			:= XML_rs.AddChild( tbl_30[x] );
            XML_data2.NodeValue := u.F_CategoryName3;
        end;

        Inc( x );

        if True = u.E_ProgramName then begin
            XML_data2 			:= XML_rs.AddChild( tbl_30[x] );
            XML_data2.NodeValue := u.F_ProgramName;
        end;

        Inc( x );

        if True = u.E_IsLocked then begin
            XML_data2 			:= XML_rs.AddChild( tbl_30[x] );
            XML_data2.NodeValue := u.F_IsLocked;
        end;

        Inc( x );

        if True = u.E_CreatedDateTime then begin
            XML_data2 			:= XML_rs.AddChild( tbl_30[x] );
            XML_data2.NodeValue := u.F_CreatedDateTime;
        end;

        Inc( x );

        if True = u.E_UpdatedDateTime then begin
            XML_data2 			:= XML_rs.AddChild( tbl_30[x] );
            XML_data2.NodeValue := u.F_UpdatedDateTime;
        end;

        Inc( x );

        if  True = u.E_CategoryOrder then begin
            XML_data2 			:= XML_rs.AddChild( tbl_30[x] );
            XML_data2.NodeValue := u.F_CategoryOrder;
        end;

        Inc( x );

        if True = u.E_CategoryOrder2 then begin
            XML_data2 			:= XML_rs.AddChild( tbl_30[x] );
            XML_data2.NodeValue := u.F_CategoryOrder2;
        end;

        Inc( x );

        if True = u.E_CategoryOrder3 then begin
            XML_data2 			:= XML_rs.AddChild( tbl_30[x] );
            XML_data2.NodeValue := u.F_CategoryOrder3;
        end;

        Inc( x );

        if True = u.E_ProgramMemo then begin
            XML_data2 			:= XML_rs.AddChild( tbl_30[x] );
            XML_data2.NodeValue := u.F_ProgramMemo;
        end;

        Inc( x );

        if True = u.E_ProgramOrder then begin
            XML_data2 			:= XML_rs.AddChild( tbl_30[x] );
            XML_data2.NodeValue := u.F_ProgramOrder;
        end;

        Inc( x );

        if True = u.E_SystemMode then begin
            XML_data2 			:= XML_rs.AddChild( tbl_30[x] );
            XML_data2.NodeValue := u.F_SystemMode;
        end;

    end;

end;


//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
const
    tbl_31  : array [0..2] of string = (
        'F_Id',
        'F_CategoryName',
        'F_Order'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TProgramIndexDb.PiCategoryLoad( cnl : IXMLNodeList; cate : integer );
var
    j : integer;
    str, txt : string;
    u : TPiCategory;

begin

    u := TPiCategory.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl_31 ) of
        0:  begin   u.F_Id              := txt;     u.E_Id              := True;    end;
        1:  begin   u.F_CategoryName    := txt;     u.E_CategoryName    := True;    end;
        2:  begin   u.F_Order           := txt;     u.E_Order           := True;    end;
        else
            begin
                _beep;
            end;
        end;
    end;

    FPiCategoryList[cate].Add( u );
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TProgramIndexDb.PiCategorySave( XML_Doc : IXMLDocument; cate : integer ); //; u : TPiCategory );
var
	XML_rs    	: IXMLNode;
	XML_data2   : IXMLNode;
    i, x : integer;
    u : TPiCategory;

begin

    for i:=0 to FPiCategoryList[ cate ].Count-1 do begin

        XML_rs := XML_Doc.DocumentElement.AddChild( FProgIndexDbTable[ cate + 1 ] );

        u := FPiCategoryList[ cate ].Data[i];

        x := 0;

        if True = u.E_Id then begin
            XML_data2 			:= XML_rs.AddChild( tbl_31[x] );
            XML_data2.NodeValue := u.F_Id;
        end;

        Inc( x );

        if True = u.E_CategoryName then begin
            XML_data2 			:= XML_rs.AddChild( tbl_31[x] );
            XML_data2.NodeValue := u.F_CategoryName;
        end;

        Inc( x );

        if True = u.E_Order then begin
            XML_data2 			:= XML_rs.AddChild( tbl_31[x] );
            XML_data2.NodeValue := u.F_Order;
        end;

    end;

end;

//------------------------------------------------------------------------------
//  XMLファイル書き込み
//------------------------------------------------------------------------------
procedure TProgramIndexDb.Save( fn : string );
var
	XML_Doc     : IXMLDocument;
    i : integer;

begin
	// XML書き込み処理
    XML_Doc 			:= TXMLDocument.Create(nil);

	// 出力時にインデント
    XML_Doc.Options 	:= [doNodeAutoIndent];
	XML_Doc.Active  	:= True;
//    XML_Doc.Encoding	:= 'UTF-8';
//    XML_Doc.Version		:= '1.0';
    XML_Doc.Version		:= '1.0';
    XML_Doc.StandAlone  := 'yes';

    // ルート
    XML_Doc.AddChild( 'ProgramIndexDb' );

    // Program
    ProgramIndexSave( XML_Doc );

    // PiCategory, PiCategory2, PiCategory3
    for i:=0 to HIGH( FPiCategoryList ) do begin
        PiCategorySave( XML_Doc, i );
    end;

    // 保存
	try
    	if fn <> '' then	XML_Doc.SaveToFile( fn );
    except
		;
    end;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TAcTerminal.Create;
begin
    inherited;

    F_Id                                := '';
    F_Name                              := '';
    F_IpAddress                         := '';
    F_IsSaveButtonEnabled               := '';
    F_IsDefaultProgramLockButtonEnabled := '';
    F_IsRecBusNameEditable              := '';
    F_PermissionId                      := '';
    F_UnDeletable                       := '';
    F_IsServer                          := '';
    F_IsImExEnabled                     := '';
    F_IsLocked                          := '';
    F_IsOffLineTerminal                 := '';
    F_IsAllGroupEnabled                 := '';
    F_OnLineButtonEnabled               := '';
    F_IsPanelPageNameEditEnabled        := '';

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TAcTerminal.Destroy;
begin
    inherited;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TAcTerminalList.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TAcTerminalList.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TAcTerminalList.GetData( index : integer ) : TAcTerminal;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TAcTerminal( Items[ index ] );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TAcTerminalList.ClearAll;
var
    dt : TAcTerminal;

begin
    while True do begin
        dt := Data[0];
        if nil = dt then break;

        Extract( dt );
        dt.Free;
    end;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TAcPermission.Create;
begin
    inherited;

    F_Id                                := '';
    F_Name                              := '';
    F_Description                       := '';
    F_IsRejectFilter                    := '';

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TAcPermission.Destroy;
begin
    inherited;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TAcPermissionList.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TAcPermissionList.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TAcPermissionList.GetData( index : integer ) : TAcPermission;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TAcPermission( Items[ index ] );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TAcPermissionList.ClearAll;
var
    dt : TAcPermission;

begin
    while True do begin
        dt := Data[0];
        if nil = dt then break;

        Extract( dt );
        dt.Free;
    end;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TAcFilter.Create;
begin
    inherited;

    F_Id                                := '';
    F_PermissionId                      := '';
    F_TargetTypeName                    := '';
    F_TargetInstanceId                  := '';
    F_Enabled                           := '';

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TAcFilter.Destroy;
begin
    inherited;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TAcFilterList.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TAcFilterList.Destroy;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TAcFilterList.GetData( index : integer ) : TAcFilter;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TAcFilter( Items[ index ] );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TAcFilterList.ClearAll;
var
    dt : TAcFilter;

begin
    while True do begin
        dt := Data[0];
        if nil = dt then break;

        Extract( dt );
        dt.Free;
    end;

end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TAccountDb.Create;
begin
    inherited;

    FAcTerminalList     := TAcTerminalList.Create;
    FAcPermissionList   := TAcPermissionList.Create;
    FAcFilterList       := TAcFilterList.Create;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TAccountDb.Destroy;
begin

    FAcTerminalList.ClearAll;
    FAcTerminalList.Free;

    FAcPermissionList.ClearAll;
    FAcPermissionList.Free;

    FAcFilterList.ClearAll;
    FAcFilterList.Free;

    inherited;
end;

const
    FAccountDbTable : array [0..2] of string = (
        'AcTerminal',
        'AcPermission',
        'AcFilter'
    );

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TAccountDb.Load( fn : string ) : Boolean;
var
    xml : IXMLDocument;
   	cnl, cnl0 : IXMLNodeList;
    j, n : integer;
	a : string;

begin
    Result := False;

    // ファイルなし
    if False = FileExists( fn ) then Exit;

    // XML読み込み
    xml	:= LoadXMLDocument( fn );

    // 'ProgramIndexDb'
    cnl0	:= xml.DocumentElement.ChildNodes;

    for j:=0 to cnl0.Count-1 do begin

        a    := cnl0.Nodes[j].NodeName;

        n := AnsiIndexStr( a, FAccountDbTable );
        if n = -1 then begin
//            Inc( count[ 1 ] );
            _beep;
            continue;
        end;

//        Inc( count[ n ] );

        cnl		:= cnl0.Nodes[j].ChildNodes;

        case n of
        0:  AcTerminalload( cnl );
        1:  AcPermissionLoad( cnl );
        2:  AcFilterLoad( cnl );
        end;

    end;

{
    m := 0;
    for j:=0 to HIGH( count ) do begin
        m := m + count[j];
    end;
}
    Result := False;
end;


//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
const
    tbl_40  : array [0..14] of string = (
        'F_Id',
        'F_Name',
        'F_IpAddress',
        'F_IsSaveButtonEnabled',
        'F_IsDefaultProgramLockButtonEnabled',
        'F_IsRecBusNameEditable',
        'F_PermissionId',
        'F_UnDeletable',
        'F_IsServer',
        'F_IsImExEnabled',
        'F_IsLocked',
        'F_IsOffLineTerminal',
        'F_IsAllGroupEnabled',
        'F_OnLineButtonEnabled',
        'F_IsPanelPageNameEditEnabled'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TAccountDb.AcTerminalload( cnl : IXMLNodeList );
var
    j : integer;
    str, txt : string;
    u : TAcTerminal;

begin

    u := TAcTerminal.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl_40 ) of
        0:  u.F_Id                                  := txt;
        1:  u.F_Name                                := txt;
        2:  u.F_IpAddress                           := txt;
        3:  u.F_IsSaveButtonEnabled                 := txt;
        4:  u.F_IsDefaultProgramLockButtonEnabled   := txt;
        5:  u.F_IsRecBusNameEditable                := txt;
        6:  u.F_PermissionId                        := txt;
        7:  u.F_UnDeletable                         := txt;
        8:  u.F_IsServer                            := txt;
        9:  u.F_IsImExEnabled                       := txt;
        10: u.F_IsLocked                            := txt;
        11: u.F_IsOffLineTerminal                   := txt;
        12: u.F_IsAllGroupEnabled                   := txt;
        13: u.F_OnLineButtonEnabled                 := txt;
        14: u.F_IsPanelPageNameEditEnabled          := txt;

        else
            begin
                _beep;
            end;
        end;
    end;

    FAcTerminalList.Add( u );
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
const
    tbl_41  : array [0..3] of string = (
        'F_Id',
        'F_Name',
        'F_Description',
        'F_IsRejectFilter'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TAccountDb.AcPermissionLoad( cnl : IXMLNodeList );
var
    j : integer;
    str, txt : string;
    u : TAcPermission;

begin

    u := TAcPermission.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl_41 ) of
        0:  u.F_Id              := txt;
        1:  u.F_Name            := txt;
        2:  u.F_Description     := txt;
        3:  u.F_IsRejectFilter  := txt;
        else
            begin
                _beep;
            end;
        end;
    end;

    FAcPermissionList.Add( u );
end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
const
    tbl_42  : array [0..4] of string = (
        'F_Id',
        'F_PermissionId',
        'F_TargetTypeName',
        'F_TargetInstanceId',
        'F_Enabled'
    );

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TAccountDb.AcFilterLoad( cnl : IXMLNodeList );
var
    j : integer;
    str, txt : string;
    u : TAcFilter;

begin

    u := TAcFilter.Create;

    for j:=0 to cnl.Count-1 do begin

        str	:= cnl.Nodes[j].NodeName;
        txt	:= cnl.Nodes[j].Text;

        case AnsiIndexStr( str, tbl_42 ) of
        0:  u.F_Id                  := txt;
        1:  u.F_PermissionId        := txt;
        2:  u.F_TargetTypeName      := txt;
        3:  u.F_TargetInstanceId    := txt;
        4:  u.F_Enabled             := txt;
        else
            begin
                _beep;
            end;
        end;
    end;

    FAcFilterList.Add( u );
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TLayoutData.Create;
begin
    inherited;

    FFrame      := nil;
    FList       := TLayoutButtonList.Create;

//    FChild[0]   := TLayoutList.Create;
//    FChild[1]   := TLayoutList.Create;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TLayoutData.Destroy;
begin

    if nil <> FFrame then
        FFrame.Free;

    if nil <> FList then begin
        FList.ClearAll;
        FList.Free;
    end;

//    FChild[0].Free;
//    FChild[1].Free;

    inherited;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TLayoutData.Clone : TLayoutData;
var
    cp : TLayoutData;

begin
    cp          := TLayoutData.Create;

    if nil <> FFrame then
        cp.Frame    := FFrame.Clone;

    cp.List.Free;
    cp.List     := FList.Clone;

    Result      := cp;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TLayoutData.IsEmpty : Boolean;
begin
    Result := (nil = FFrame) or (nil = FList);
end;

//-----------------------------------------------------------------------------
//  カテゴリ
//-----------------------------------------------------------------------------
function TLayoutData.Getcategory( c : integer ) : TLayoutButton;
begin
    Result := FList.Data[ c ];
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TLayoutData.GetGroup( c, ds : integer ) : TLayoutData;
var
    cbtn : TLayoutButton;

begin

    // カテゴリ
    cbtn    := FList.Data[ c ];

    // グループのリスト
    Result := cbtn.Child[ ds ];
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TLayoutData.GetGroupLayout( c, g, ds : integer ) : TLayoutData;
var
    cbtn, gbtn : TLayoutButton;
    lay : TLayoutData;

begin
    Result := nil;

    // カテゴリ
    cbtn    := FList.Data[ c ];
    if nil = cbtn then Exit;

    // グループのリスト
    lay     := cbtn.Child[ ds ];
    if nil = lay then Exit;

    // グループのボタン
    gbtn    := lay.List.Data[ g ];
    if nil = gbtn then Exit;

    Result := gbtn.Child[ ds ];
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TLayoutButton.Create;
begin
    inherited;

    FButton     := nil;

    FChild[0]   := nil;
    FChild[1]   := nil;
end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TLayoutButton.Destroy;
begin
    if nil <> FButton then
        FButton.Free;

    if nil <> FChild[0] then
        FChild[0].Free;

    if nil <> FChild[1] then
        FChild[1].Free;

    inherited;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TLayoutButton.Clone : TLayoutButton;
var
    cp : TLayoutButton;

begin
    cp          := TLayoutButton.Create;
    cp.FButton  := FButton.Clone;

    if nil <> FChild[0] then
        cp.FChild[0]    := FChild[0].Clone;

    if nil <> FChild[1] then
        cp.FChild[1]    := FChild[1].Clone;

    Result := cp;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TLayoutButton.GetChild( index : integer ) : TLayoutData;
begin
    Result := FChild[ index ];
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TLayoutButton.SetChild( index : integer; ly : TLayoutData );
begin
    FChild[ index ] := ly;
end;


//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TLayoutButtonList.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TLayoutButtonList.Destroy;
begin


    inherited;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TLayoutButtonList.GetData( index : integer ) : TLayoutButton;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TLayoutButton( Items[ index ] );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TLayoutButtonList.ClearAll : integer;
var
    d : TLayoutButton;

begin
    Result := Count;

    while True do begin
        d := data[0];
        if d = nil then break;

        Extract( d );
        d.Free;
    end;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TLayoutButtonList.Clone : TLayoutButtonList;
var
    cp : TLayoutButtonList;
    i : integer;
    d : TLayoutButton;

begin
    cp := TLayoutButtonList.Create;

    for i:=0 to Count-1 do begin
        d := Data[i];
        cp.Add( d.Clone );
    end;

    Result := cp;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TLayoutButtonList.SearchId( id : integer ) : TLayoutButton;
var
    d : TLayoutButton;
    i : integer;

begin

    for i:=0 to Count-1 do begin
        d := Data[i];
        if d = nil then break;

        if d.Button.F_Id = id then begin
            Result := d;
            Exit;
        end;
    end;

    Result := nil;
end;

//-----------------------------------------------------------------------------
//	話数の降順
//-----------------------------------------------------------------------------
function SortButtonOrder_Down( item1, item2 : Pointer ) : integer;
var
	n1, n2 : integer;

begin
    n1 := 0;
    n2 := 0;
    if nil <> item1 then
        n1 	:= StrToIntDef( TUiScreenSelectButton( TLayoutButton( item1 ).Button ).F_Order, 0 );

    if nil <> item2 then
        n2 	:= StrToIntDef( TUiScreenSelectButton( TLayoutButton( item2 ).Button ).F_Order, 0 );

	if n1 > n2 then 		Result := 1
	else if n1 < n2 then	Result := -1
    else                    Result := 0;
end;

//------------------------------------------------------------------------------
//  番組データ並び替え
//------------------------------------------------------------------------------
procedure TLayoutButtonList.SortButtonOrder;
begin
    Sort( @SortButtonOrder_Down );
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TColumnData.Create;
begin
    inherited;

    FColumn     := nil;

    FButtons    := TScreenList.Create;

    FAlias      := -1;
end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TColumnData.Destroy;
begin
    inherited;

    FColumn.Free;

    FButtons.ClearAll;
    FButtons.Free;
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TColumnList.Create;
begin
    inherited;

    FList   := nil;
end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TColumnList.Destroy;
begin
    FList.Free;

    inherited;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TColumnList.GetData( index : integer ) : TColumnData;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TColumnData( Items[ index ] );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TColumnList.ClearAll;
var
    d : TColumnData;

begin
    while True do begin
        d := data[0];
        if d = nil then break;

        Extract( d );
        d.Free;
    end;
end;

//-----------------------------------------------------------------------------
//  空にする
//-----------------------------------------------------------------------------
procedure TColumnList.Empty;
var
    d : TColumnData;

begin
    while True do begin
        d := Data[0];
        if d = nil then break;

        Extract( d );
    end;
end;


//-----------------------------------------------------------------------------
//	話数の降順
//-----------------------------------------------------------------------------
function SortOrder_Down( item1, item2 : Pointer ) : integer;
var
	n1, n2 : integer;

begin
    n1 	:= StrToIntDef( String( TColumnData( item1 ).Column.F_Order ), 0 );
    n2 	:= StrToIntDef( String( TColumnData( item2 ).Column.F_Order ), 0 );
	if n1 > n2 then 		Result := 1
	else if n1 < n2 then	Result := -1
    else                    Result := 0;
end;

//------------------------------------------------------------------------------
//  番組データ並び替え
//------------------------------------------------------------------------------
procedure TColumnList.SortOrder;
begin
    Sort( @SortOrder_Down );
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TListLayout.Create;
begin
    inherited;

    FColumnList[0]  := TColumnList.Create;
    FColumnList[1]  := TColumnList.Create;
end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TListLayout.Destroy;
begin

    FColumnList[0].ClearAll;
    FColumnList[0].Free;

    FColumnList[1].ClearAll;
    FColumnList[1].Free;

    inherited;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TListLayout.GetColumnList( ds : integer ) : TColumnList;
begin
    Result := FColumnList[ ds ];
end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TListLayoutList.Create;
begin
    inherited;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TListLayoutList.Destroy;
begin

    inherited;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TListLayoutList.GetData( index : integer ) : TListLayout;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TListLayout( Items[ index ] );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TListLayoutList.ClearAll;
var
    d : TListLayout;

begin
    while True do begin
        d := Data[0];
        if nil = d then break;

        Extract( d );
        d.Free;
    end;
end;


//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TLayoutBlock.Create;
var
    i : integer;

begin
    inherited;

    for i:=0 to HIGH( FLayoutData ) do begin
        FLayoutData[i]  := nil;
    end;
end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TLayoutBlock.Destroy;
var
    i : integer;

begin

    for i:=0 to HIGH( FLayoutData ) do begin
        FLayoutData[i].Free;
        FLayoutData[i]  := nil;
    end;

    inherited;
end;

//-----------------------------------------------------------------------------
//  ワークデータコピー
//-----------------------------------------------------------------------------
class function TLayoutBlock.Copy( dt : array of TLayoutData ) : TLayoutBlock;
var
    i : integer;
    cp : TLayoutBlock;

begin
    cp := TLayoutBlock.Create;

    for i:=0 to Length( dt )-1 do begin
        cp.FLayoutData[i]   := dt[i].Clone;
    end;

    Result := cp;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TLayoutBlock.Restore( var dt : array of TLayoutData );
var
    i : integer;

begin

    // ワークデータ廃棄
    for i:=0 to Length( dt )-1 do begin

        // 廃棄して
        dt[i].Free;

        // UNDOデータをコピー
        dt[i]   := FLayoutData[i].Clone;
    end;

end;


//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//-----------------------------------------------------------------------------
//  コンストラクタ
//-----------------------------------------------------------------------------
constructor TLayoutBlockList.Create;
begin
    inherited;

    FWP := 0;
    FRP := 0;

end;

//-----------------------------------------------------------------------------
//  デストラクタ
//-----------------------------------------------------------------------------
destructor TLayoutBlockList.Destroy;
begin

    inherited;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TLayoutBlockList.GetData( index : integer ) : TLayoutBlock;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TLayoutBlock( Items[ index ] );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TLayoutBlockList.ClearAll;
var
    d : TLayoutBlock;

begin
    while True do begin
        d := data[0];
        if d = nil then break;

        Extract( d );
        d.Free;
    end;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TLayoutBlockList.IncWriter;
begin
    FWP := FWP + 1;
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TLayoutBlockList.Last : TLayoutBlock;
begin
    Result := Data[Count-1];
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TLayoutBlockList.Undo : TLayoutBlock;
begin
    Result := nil;

    if FWP < 1  then Exit;

    Dec( FWP );
    Result := Data[ FWP ];
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TLayoutBlockList.Redo : TLayoutBlock;
begin
    Result := nil;

    if FWP >= (Count-1)  then Exit;

    Inc( FWP );
    Result := Data[ FWP ];
end;


end.

(*
const
    FXPTSourceTable : array [0..7] of string = (
        'PgSettings',
        'PgXpt',
        'PgDevice',
        'PgBkupData',
        'PgDstName',

        'PgSrcName',

        'PgSrcKeyColor',
        'PgPanelKey'
    );

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TXPTSourceList.Load( fn : string ) : Boolean;
var
    xml : IXMLDocument;
   	cnl, cnl0 : IXMLNodeList;
    j, n : integer;
	a : string;
    count : array [0..15] of integer;

    s : TXPTSourceData;
    st : TPgSettingData;


begin
    Result := False;

    // ファイルなし
    if False = FileExists( fn ) then Exit;

    // XML読み込み
    xml	:= LoadXMLDocument( fn );

    // 'ProgramDb'
    cnl0	:= xml.DocumentElement.ChildNodes;

    for j:=0 to cnl0.Count-1 do begin

        a    := cnl0.Nodes[j].NodeName;

        n := AnsiIndexStr( a, FXPTSourceTable );
        if n = -1 then begin
//            _beep;

//            Inc( count[ 1 ] );

            continue;
        end;

        Inc( count[ n ] );

        cnl		:= cnl0.Nodes[j].ChildNodes;

        case n of
        0:  st  := PgSettingLoad( cnl );

        5:  s   := XPTSourceLoad( cnl );

        else
            s := nil;
        end;

        if s <> nil then begin
            Add( s );
        end;

    end;

{
    m := 0;
    for j:=0 to HIGH( count ) do begin
        m := m + count[j];
    end;
}
    Result := False;
end;
*)




(*
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TProgramDbList.GetData( index : integer ) : TProgramDb;
begin
    Result := nil;

    if (index < 0) or (Count <= index) then Exit;

    Result := TProgramDb( Items[ index ] );
end;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
procedure TProgramDbList.ClearAll;
var
    dt : TProgramDb;

begin
    while True do begin
        dt := Data[0];
        if dt = nil then break;

        Extract( dt );
        dt.Free;
    end;

end;

const
    FProgramDbTable : array [0..7] of string = (
        'PgSettings',
        'PgXpt',
        'PgDevice',
        'PgBkupData',
        'PgDstName',

        'PgSrcName',

        'PgSrcKeyColor',
        'PgPanelKey'
    );

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TProgramDbList.Load( fn : string ) : Boolean;
var
    xml : IXMLDocument;
   	cnl, cnl0 : IXMLNodeList;
    j, n : integer;
	a : string;
    count : array [0..15] of integer;

    s : TXPTSourceData;

begin
    Result := False;

    // ファイルなし
    if False = FileExists( fn ) then Exit;

    // XML読み込み
    xml	:= LoadXMLDocument( fn );

    // 'ProgramDb'
    cnl0	:= xml.DocumentElement.ChildNodes;

    for j:=0 to cnl0.Count-1 do begin

        a    := cnl0.Nodes[j].NodeName;

        n := AnsiIndexStr( a, FXPTSourceTable );
        if n = -1 then begin
            beep;

            continue;
        end;

        Inc( count[ n ] );

        cnl		:= cnl0.Nodes[j].ChildNodes;

        case n of
        0:  s := ProgramDbLoad( cnl );
        1:  s := DisplayEmptyTypeLoad( cnl );
        2:  s := DisplayDisplayEmptyValueLoad( cnl );
        3:  s := DisplayDspSettingsLoad( cnl );
        else
            s := nil;
        end;

        if s <> nil then begin
            Add( s );
        end;

    end;

{
    m := 0;
    for j:=0 to HIGH( count ) do begin
        m := m + count[j];
    end;
}
    Result := False;
end;
*)

(*
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function TScreenList.GetChildFrame( id : integer ) : integer;
var
    s : TScreenDb;
    i, ret : integer;
    u : TUiFrame;
    idstr : string;

begin

    idstr := IntToStr( id );

    ret := 0;

    for i:=0 to FList[ UiFrame_No ].Count-1 do begin

        u := TUiFrame( FList[ UiFrame_No ].Data[i] );

        if (True = u.E_ParentFrameId) and (idstr = u.F_ParentFrameId) then begin

            Inc( ret );

        end;

    end;


{
    for i:=0 to Count-1 do begin

        s := Data[i];

        if 0 <> s.FDataType then continue;

        u := TUiFrame( s );
        if (True = u.E_ParentFrameId) and (idstr = u.F_ParentFrameId) then begin

            Inc( ret );

        end;

    end;
}
    Result := ret;
end;
*)

