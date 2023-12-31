/// 
Class aaa.clientabcde Extends %Persistent [ ClassType = persistent, DdlAllowed, Final, Owner = {_SYSTEM}, ProcedureBlock, SqlRowIdPrivate, SqlTableName = client_abcde ]
{

Property name As %Library.String(MAXLEN = 500) [ SqlColumnNumber = 2 ];

Property datedenaissance As %Library.Date [ SqlColumnNumber = 3, SqlFieldName = date_de_naissance ];

Property home As User.address [ SqlColumnNumber = 4 ];

Property work As User.address [ SqlColumnNumber = 5 ];

Parameter USEEXTENTSET = 1;

/// Bitmap Extent Index auto-generated by DDL CREATE TABLE statement.  Do not edit the SqlName of this index.
Index DDLBEIndex [ Extent, SqlName = "%%DDLBEIndex", Type = bitmap ];

Storage Default
{
<Data name="clientabcdeDefaultData">
<Value name="1">
<Value>name</Value>
</Value>
<Value name="2">
<Value>datedenaissance</Value>
</Value>
<Value name="3">
<Value>home</Value>
</Value>
<Value name="4">
<Value>work</Value>
</Value>
</Data>
<DataLocation>^EOWx.AUiq.1</DataLocation>
<DefaultData>clientabcdeDefaultData</DefaultData>
<ExtentLocation>^EOWx.AUiq</ExtentLocation>
<IdFunction>sequence</IdFunction>
<IdLocation>^EOWx.AUiq.1</IdLocation>
<Index name="DDLBEIndex">
<Location>^EOWx.AUiq.2</Location>
</Index>
<Index name="IDKEY">
<Location>^EOWx.AUiq.1</Location>
</Index>
<IndexLocation>^EOWx.AUiq.I</IndexLocation>
<StreamLocation>^EOWx.AUiq.S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
