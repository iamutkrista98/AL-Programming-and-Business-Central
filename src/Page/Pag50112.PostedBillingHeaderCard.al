page 50112 PostedBillingHeaderCard
{
    Caption = 'PostedBillingHeaderCard';
    PageType = Card;
    SourceTable = "PostedBillingHeader";
    //Editable = false;


    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Sell to Customer"; Rec."Sell to Customer")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sell to Customer field.';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of Customer Name field';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Amount field.';
                }
            }
            group("PostedBillingLine")
            {
                part("Billing Line"; PostedBillingLine)
                {
                    SubPageLink = "Document No" = field("No.");
                    UpdatePropagation = Both;
                    ApplicationArea = All;


                }


            }
        }

    }
}
