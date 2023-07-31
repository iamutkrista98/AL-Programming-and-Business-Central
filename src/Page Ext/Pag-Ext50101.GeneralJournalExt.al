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
            field("Training"; Rec.Training)
            {
                ApplicationArea = All;

            }
            field("Tax Amount"; Rec."Sum of Tax")
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
