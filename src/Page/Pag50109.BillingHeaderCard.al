page 50109 BillingHeaderCard
{
    Caption = 'BillingHeader';
    PageType = Card;
    SourceTable = "Billing Header";

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
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Name field.';

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
                field("Sell to Customer"; Rec."Sell to Customer")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sell to Customer field.';
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
            group("BillingLine")
            {
                part("Billing Line"; BillingLineSubform)
                {
                    SubPageLink = "Document No" = field("No.");
                    UpdatePropagation = Both;
                    ApplicationArea = All;


                }

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
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Post;

                trigger OnAction()
                var
                    BillMgt: Codeunit "Purchase Management";
                begin
                    if not Confirm('Do you want to post?', false) then
                        exit;
                    BillMgt.PostBillToPostedBill(Rec."No.");
                    Message('Document has been posted successfully!');

                end;

                // trigger OnAction()
                // var
                //     BillPost: Codeunit "Purchase Management";
                // begin
                //     if not Confirm('Do you want to post?', false) then
                //         exit;
                //     BillPost.PostBillToPostedBill(Rec."No.");
                //     Message('Document has been posted!');
                // end;

            }
        }
    }
}
