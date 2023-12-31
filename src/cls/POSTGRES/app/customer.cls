/// Generated by the Link Table wizard on 2022-12-21 07:06:58.  Note that you can access the data in this class only when the external database is accessible.
Class POSTGRES.app.customer Extends %Library.Persistent [ Owner = {_SYSTEM}, Not ProcedureBlock, SqlRowIdPrivate, SqlTableName = POSTGRES_customer, StorageStrategy = GSQLStorage ]
{

/// Specifies details for the SQL Gateway Connection that this class uses
Parameter CONNECTION = "postgres,NOCREATE";

/// Specifies the external database that this class uses
Parameter EXTDBNAME = "PostgreSQL";

/// Determines if INSERT statements for this external table attempt to retrieve auto-generated keys.  Set this to 0 if this external table does not support auto generated keys.
Parameter EXTERNALGENERATEDKEYS = 1;

/// Specifies the external table to which this class refers
Parameter EXTERNALTABLENAME = "app.customer";

Property active As %Boolean(EXTERNALSQLNAME = "active", EXTERNALSQLTYPE = -7) [ SqlColumnNumber = 6, SqlFieldName = active ];

Property category As %Integer(EXTERNALSQLNAME = "category", EXTERNALSQLTYPE = 4) [ SqlColumnNumber = 7, SqlFieldName = category ];

Property city As %String(EXTERNALSQLNAME = "city", EXTERNALSQLTYPE = 12, MAXLEN = 100) [ SqlColumnNumber = 5, SqlFieldName = city ];

Property country As %String(EXTERNALSQLNAME = "country", EXTERNALSQLTYPE = 12, MAXLEN = 100) [ SqlColumnNumber = 10, SqlFieldName = country ];

Property created As %TimeStamp(EXTERNALSQLNAME = "created", EXTERNALSQLTYPE = 93) [ SqlColumnNumber = 12, SqlFieldName = created ];

Property description As %Stream.GlobalCharacter(CLASSNAME = 2, EXTERNALSQLNAME = "description", EXTERNALSQLTYPE = 12) [ SqlColumnNumber = 11, SqlFieldName = description ];

Property firstname As %String(EXTERNALSQLNAME = "first_name", EXTERNALSQLTYPE = 12, MAXLEN = 100) [ SqlColumnNumber = 4, SqlFieldName = first_name ];

Property gender As %String(EXTERNALSQLNAME = "gender", EXTERNALSQLTYPE = 12, MAXLEN = 100) [ SqlColumnNumber = 9, SqlFieldName = gender ];

Property hashtag As %Stream.GlobalBinary(CLASSNAME = 2, EXTERNALSQLNAME = "hashtag", EXTERNALSQLTYPE = -2) [ SqlColumnNumber = 8, SqlFieldName = hashtag ];

Property id As %Integer(EXTERNALSQLNAME = "id", EXTERNALSQLTYPE = 4) [ Required, SqlColumnNumber = 2, SqlFieldName = id ];

Property inserted As %TimeStamp(EXTERNALSQLNAME = "inserted", EXTERNALSQLTYPE = 93) [ SqlColumnNumber = 13, SqlFieldName = inserted ];

Property lastname As %String(EXTERNALSQLNAME = "last_name", EXTERNALSQLTYPE = 12, MAXLEN = 100) [ SqlColumnNumber = 3, SqlFieldName = last_name ];

Property lastupdate As %TimeStamp(EXTERNALSQLNAME = "lastupdate", EXTERNALSQLTYPE = 93) [ SqlColumnNumber = 14, SqlFieldName = lastupdate ];

Index MainIndex On id [ IdKey, PrimaryKey ];

Storage GSQLStorage
{
<StreamLocation>^POSTGRES.app.customerS</StreamLocation>
<Type>%Storage.SQL</Type>
}

}
