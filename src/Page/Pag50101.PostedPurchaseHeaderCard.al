page 50101 PostedPurchaseHeaderCard
{
    Caption = 'PostedPurchaseHeaderCard';
    PageType = Card;
    SourceTable = PostedPurchaseHeader;
    Editable = false;

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
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vendor Name field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Address field.';
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
                field("Buy From Vendor"; Rec."Buy From Vendor")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Buy From Vendor field.';
                }
                field("Received By"; Rec."Received By")
                {
                    ApplicationArea = All;

                }
            }

            part("Posted Purchase Line"; PostedPurchaseLine)
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = field("No.");
                UpdatePropagation = Both;


            }


        }
    }

    actions
    {
        area(Processing)
        {
            // 
        }
    }
}
