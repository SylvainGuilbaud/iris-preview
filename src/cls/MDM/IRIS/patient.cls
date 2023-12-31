/// 
Class MDM.IRIS.patient Extends %Persistent [ ClassType = persistent, DdlAllowed, Final, Owner = {_SYSTEM}, ProcedureBlock, SqlRowIdPrivate, SqlTableName = patient ]
{

Property ID As %Library.Integer(MAXVAL = 2147483647, MINVAL = -2147483648) [ SqlColumnNumber = 2 ];

Property col1 As %Library.String(MAXLEN = 200) [ SqlColumnNumber = 3 ];

Property col2 As %Library.String(MAXLEN = 200) [ SqlColumnNumber = 4 ];

Property col3 As %Library.String(MAXLEN = 200) [ SqlColumnNumber = 5 ];

Parameter USEEXTENTSET = 1;

/// Bitmap Extent Index auto-generated by DDL CREATE TABLE statement.  Do not edit the SqlName of this index.
Index DDLBEIndex [ Extent, SqlName = "%%DDLBEIndex", Type = bitmap ];

Storage Default
{
<Data name="patientDefaultData">
<Value name="1">
<Value>ID</Value>
</Value>
<Value name="2">
<Value>col1</Value>
</Value>
<Value name="3">
<Value>col2</Value>
</Value>
<Value name="4">
<Value>col3</Value>
</Value>
</Data>
<DataLocation>^EOjQ.UUSZ.1</DataLocation>
<DefaultData>patientDefaultData</DefaultData>
<ExtentLocation>^EOjQ.UUSZ</ExtentLocation>
<IdFunction>sequence</IdFunction>
<IdLocation>^EOjQ.UUSZ.1</IdLocation>
<Index name="DDLBEIndex">
<Location>^EOjQ.UUSZ.2</Location>
</Index>
<Index name="IDKEY">
<Location>^EOjQ.UUSZ.1</Location>
</Index>
<IndexLocation>^EOjQ.UUSZ.I</IndexLocation>
<StreamLocation>^EOjQ.UUSZ.S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
