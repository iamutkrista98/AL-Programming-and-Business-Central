pageextension 50101 GeneralJournalExt extends "General Journal"
{
    layout
    {
        addafter(Amount)
        {
            field("TDS Amount"; Rec."TDS Amount")
            {
                ApplicationArea = All;


            }


        }
    }
    actions
    {
        addafter("B&ank")
        {
            action("Filter")
            {
                Promoted = true;
                Image = Filter;
                PromotedIsBig = true;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Rec.SetFilter(Amount, '%1..%2', 1000, 2000);
                end;



            }

        }
    }
}
