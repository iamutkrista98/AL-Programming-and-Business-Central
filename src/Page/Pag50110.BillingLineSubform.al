page 50110 BillingLineSubform
{
    Caption = 'BillingLineSubform';
    PageType = ListPart;
    SourceTable = "Billing Line";
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
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
                field(Qty; Rec.Qty)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Qty field.';

                    trigger OnValidate()
                    begin
                        CurrPage.Update(true);
                    end;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Price field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line No field.';
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
            }
        }
    }
}
