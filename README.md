# WIZMasterDetail
MasterDetail scheme on Dart

MasterDetail looks like SplitViewController in iOS.<br> 
A container that includes two controllers: a navigation controller and, corresponding to the choice, an information one. It change own representation denending on screen size. 
<br>
For example:
<br>
***Phone***
<br>
<img src="images/Phones.png" width="50%">
<br><br>
***Tablet***
<br>
<img src="images/Tablets.png" width="50%">

## How to use
You must create two controllers inherited from MasterWidget and DetailWidget.<br>
In *YourMasterWidget* you must add *itemSelectedCallback* for send information of selection to DetailWidget. <br>
In *YourDetailWidget* you must override *selectRow(int row)* for get selected row in MasterWidget.
