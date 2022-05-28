
;*** windows message crackers (windowsx.h) ***

SetWindowRedraw macro hWnd,y
	invoke SendMessage,hWnd,WM_SETREDRAW,y,0
	endm

ListBox_AddString macro hWnd,pszString
	invoke SendMessage,hWnd,LB_ADDSTRING,0,pszString
	endm
ListBox_GetCurSel macro hWnd
	invoke SendMessage,hWnd,LB_GETCURSEL,0,0
	endm
ListBox_SetCurSel macro hWnd,index
	invoke SendMessage,hWnd,LB_SETCURSEL,index,0
	endm
ListBox_SetItemData macro hWnd,index,dwData
	invoke SendMessage,hWnd,LB_SETITEMDATA,index,dwData
	endm
ListBox_GetItemData macro hWnd,index
	invoke SendMessage,hWnd,LB_GETITEMDATA,index,0
	endm

ListView_InsertColumn macro hWnd,y,z
	invoke SendMessage,hWnd,LVM_INSERTCOLUMN,y,z
	endm
ListView_DeleteColumn macro hWnd,y
	invoke SendMessage,hWnd,LVM_DELETECOLUMN,y,0
	endm
ListView_InsertItem macro hWnd,pItem
	invoke SendMessage,hWnd,LVM_INSERTITEM,0,pItem
	endm
ListView_DeleteItem macro hWnd,iItem
	invoke SendMessage,hWnd,LVM_DELETEITEM,iItem,0
	endm
ListView_DeleteAllItems macro hWnd
	invoke SendMessage,hWnd,LVM_DELETEALLITEMS,0,0
	endm
ListView_GetItem macro hWnd,pItem
	invoke SendMessage,hWnd,LVM_GETITEM,0,pItem
	endm
ListView_SetItem macro hWnd,pItem
	invoke SendMessage,hWnd,LVM_SETITEM,0,pItem
	endm
ListView_GetItemText macro hWnd,iItem,iSubItem_,pszText_,cchTextMax_
	sub esp,sizeof LV_ITEM
	mov [esp].LV_ITEM.iSubItem,iSubItem_
	mov [esp].LV_ITEM.pszText,pszText_
	mov [esp].LV_ITEM.cchTextMax,cchTextMax_
	invoke SendMessage,hWnd,LVM_GETITEMTEXT,iItem,esp
	add esp,sizeof LV_ITEM
	endm

ListView_GetNextItem macro hWnd,y,z
	invoke SendMessage,hWnd,LVM_GETNEXTITEM,y,z
	endm
ListView_SetItemState macro hWnd,iItem,iState,iStateMask
	sub esp,sizeof LV_ITEM
	mov [esp].LV_ITEM.state,iState
	mov [esp].LV_ITEM.stateMask,iStateMask
	invoke SendMessage,hWnd,LVM_SETITEMSTATE,iItem,esp
	add esp,sizeof LV_ITEM
	endm
ListView_GetSelectedCount macro hWnd
	invoke SendMessage,hWnd,LVM_GETSELECTEDCOUNT,0,0
	endm
ListView_GetItemCount macro hWnd
	invoke SendMessage,hWnd,LVM_GETITEMCOUNT,0,0
	endm
ListView_SetItemCount macro hWnd,items
	invoke SendMessage,hWnd,LVM_SETITEMCOUNT,items,0
	endm
ListView_SortItems macro hWnd,y,z
	invoke SendMessage,hWnd,LVM_SORTITEMS,z,y
	endm
ListView_CreateDragImage macro hWnd,iItem,lpPoint
	invoke SendMessage,hWnd,LVM_CREATEDRAGIMAGE,iItem,lpPoint
	endm
ListView_HitTest macro hWnd,lpHitTest
	invoke SendMessage,hWnd,LVM_HITTEST,0,lpHitTest
	endm
ListView_SetExtendedListViewStyle macro hWnd,y
	invoke SendMessage,hWnd,LVM_SETEXTENDEDLISTVIEWSTYLE,0,y
	endm
ListView_EnsureVisible macro hWnd,iItem,fPartial
	invoke SendMessage,hWnd,LVM_ENSUREVISIBLE,iItem,fPartial
	endm


TreeView_GetNextItem macro hWnd,hItem,flags
	invoke SendMessage,hWnd,TVM_GETNEXTITEM,flags,hItem
	endm
TreeView_InsertItem macro hWnd,pItem
	invoke SendMessage,hWnd,TVM_INSERTITEM,0,pItem
	endm
TreeView_DeleteItem macro hWnd,hItem
	invoke SendMessage,hWnd,TVM_DELETEITEM,0,hItem
	endm
TreeView_DeleteAllItems macro hWnd
	invoke SendMessage,hWnd,TVM_DELETEITEM,0,TVI_ROOT
	endm
TreeView_GetItem macro hWnd,pItem
	invoke SendMessage,hWnd,TVM_GETITEM,0,pItem
	endm
TreeView_SetItem macro hWnd,pItem
	invoke SendMessage,hWnd,TVM_SETITEM,0,pItem
	endm
TreeView_Expand macro hWnd,hItem,flags
	invoke SendMessage,hWnd,TVM_EXPAND,flags,hItem
	endm
TreeView_SelectItem macro hWnd,hItem
	invoke SendMessage,hWnd,TVM_SELECTITEM,TVGN_CARET,hItem
	endm
TreeView_GetParent macro hWnd,hItem
	TreeView_GetNextItem hWnd,hItem,TVGN_PARENT
	endm
TreeView_GetRoot macro hWnd
	TreeView_GetNextItem hWnd,0,TVGN_ROOT
	endm
TreeView_GetChild macro hWnd,hItem
	TreeView_GetNextItem hWnd,hItem,TVGN_CHILD
	endm
TreeView_GetFirstVisible macro hWnd,hItem
	TreeView_GetNextItem hWnd,hItem,TVGN_FIRSTVISIBLE
	endm
TreeView_GetNextVisible macro hWnd,hItem
	TreeView_GetNextItem hWnd,hItem,TVGN_NEXTVISIBLE
	endm
TreeView_GetSelection macro hWnd
	TreeView_GetNextItem hWnd,0,TVGN_CARET
	endm
TreeView_GetNextSibling macro hWnd,hItem
	TreeView_GetNextItem hWnd,hItem,TVGN_NEXT
	endm

TabCtrl_InsertItem macro hWnd,iTab,pTab
	invoke SendMessage,hWnd,TCM_INSERTITEM,iTab,pTab
	endm
TabCtrl_GetCurSel macro hWnd
	invoke SendMessage,hWnd,TCM_GETCURSEL,0,0
	endm
TabCtrl_SetCurSel macro hWnd,iTab
	invoke SendMessage,hWnd,TCM_SETCURSEL,iTab,0
	endm
TabCtrl_GetItem macro hWnd,index,pItem
	invoke SendMessage,hWnd,TCM_GETITEM,index,pItem
	endm
TabCtrl_AdjustRect macro hWnd,flags,pRect
	invoke SendMessage,hWnd,TCM_ADJUSTRECT,flags,pRect
	endm
