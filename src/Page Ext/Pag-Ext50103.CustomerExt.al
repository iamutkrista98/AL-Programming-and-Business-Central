pageextension 50103 CustomerExt extends "Customer List"
{
    layout
    {

    }

    actions
    {
        addafter("Request Approval")
        {
            action("Filter Action")
            {
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Category4;
                Image = FilterLines;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.SetRange(Balance, 1, 1400);
                    Message('Filter Applied Successfully to Display Records with Balance 1-1400');

                end;

            }

        }
    }
}
