page 50113 PostedBillingLine
{
    Caption = 'PostedBillingLine';
    PageType = ListPart;
    SourceTable = PostedBillingLine;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Item No"; Rec."Item No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item No field.';
                }
                field("Item Description"; Rec."Item Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item Description field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field(Qty; Rec.Qty)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Qty field.';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Price field.';
                }
                field("Line Total"; Rec."Line Total")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line Total field.';
                }
                field("Amount After Tax"; Rec."Amount After Tax")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount After Tax field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
            }
        }
    }
}
