codeunit 50200 "BSCL Subscriber Store"
{
    var
#pragma warning disable AA0470
        BSBBook_OnBeforeOnDeleteErr: Label 'You are not allowed to delete %1 %2 because it is likend by one or mor Customer';
#pragma warning restore AA0470

    [EventSubscriber(ObjectType::Table, Database::"BSB Book", OnBeforeOnDelete, '', false, false)]
    local procedure "BSB Book_OnBeforeOnDelete"(var Rec: Record "BSB Book"; var IsHandled: Boolean)
    var
        Customer: Record Customer;
    begin
        if IsHandled then
            exit;

        Customer.SetCurrentKey("BSB Favorite Book No.");
        Customer.SetRange("BSB Favorite Book No.", Rec."No.");
        if not Customer.IsEmpty then
            Error(BSBBook_OnBeforeOnDeleteErr, Rec.TableCaption, Rec."No.");
        IsHandled := true;
    end;

}