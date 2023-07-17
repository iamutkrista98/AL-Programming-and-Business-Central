page 50103 PurchaseHeaderCard
{
    Caption = 'PurchaseHeaderCard';
    PageType = Card;
    SourceTable = PurchaseHeader;

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
            part("Purchase Line"; PurchaseLine)
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
            action("Post")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                Image = Post;
                trigger OnAction()
                var
                    BillMgt: Codeunit "Purchase Management";
                begin
                    if not Confirm('Do you want to post?', false) then
                        exit;
                    BillMgt.PostPurchToPostedPurch(Rec."No.");
                    Message('Document has been posted!');
                end;
            }

            action("Total Amount By CalcSum")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                Image = Calculate;

                trigger OnAction()
                var
                    purchline: Record PurchaseLine;
                    sumamt: Decimal;

                begin
                    sumamt := 0;
                    purchline.Reset();
                    purchline.CalcSums("Line Total");
                    Message(Format(purchline."Line Total"));
                end;
            }

            action("TotalAmount")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                Image = AmountByPeriod;

                trigger OnAction()
                var
                    purchhead: Record PurchaseHeader;
                    sumamt: Decimal;
                begin
                    sumamt := 0;
                    purchhead.Reset();
                    if purchhead.FindSet() then
                        repeat
                            purchhead.CalcFields("Total Amount");
                            sumamt += purchhead."Total Amount";
                        until purchhead.Next() = 0;
                    Message('The total amount is: %1', Format(sumamt));
                end;




            }
        }
    }

}
