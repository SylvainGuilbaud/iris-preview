/// RECORDMAP: Modified during compilation of RecordMap 'EDICOM.out.INFDOC'
/// on 2021-12-08 at 11:27:43.269 [2021-12-08 11:27:43.269 UTC]
/// by user _SYSTEM
Class EDICOM.out.INFDOC Extends EnsLib.RecordMap.RecordMap
{

Parameter OBJECTNAME = "EDICOM.out.INFDOC.Record";

/// Method to retrieve a record from a stream or device. This method will be generated based on the
/// structure of the RecordMap. For testing purposes, a file name may be passed in the pStream argument.
ClassMethod GetObject(pStream As %IO.DeviceStream, Output pObject As %RegisteredObject, pTimeout As %Numeric = -1, ByRef pLookAhead As %String = "", pLabelFound As %Boolean = 0) As %Status
{
	Try {
		Set tStatus = $$$OK
		Set pObject = $$$NULLOREF
		If '$IsObject(pStream) {
			Set tFilename = pStream
			Set pStream = ##class(%IO.FileStream).%New()
			Do pStream.Open(tFilename,,pTimeout,"UTF-8", .tStatus)
			If $$$ISERR(tStatus) Quit
		}
		Set tObjectName = $parameter($this,"OBJECTNAME")
		Set tObject = $classmethod(tObjectName,"%New")
		If '$IsObject(tObject) {
			Set tStatus = $$$ERROR($$$CannotCreateObject,tObjectName)
			Quit
		}
		Set tObject.%Source = pStream.Name
		Set tGetTopFields = $parameter(tObject,"INCLUDETOPFIELDS")
		If pStream.AtEnd && (""=pLookAhead) {
			Set tStatus = $$$ERROR($$$EnsRecordMapErrStreamAtEnd, pStream.Name)
			Quit
		}
		Set pStream.CharEncoding = "UTF-8"

		#; Parse incoming stream
		Set tStatus = ..GetRecord(pStream, tObject, tGetTopFields, pTimeout, .pLookAhead, pLabelFound)
		If $$$ISERR(tStatus) Quit
	}
	Catch ex {
		Set tStatus = ex.AsStatus()
	}
	If $$$ISERR(tStatus) { Set pObject = $$$NULLOREF }
	Else { Set pObject = tObject }
	Quit tStatus
}

/// Method to write a record to a stream or device. This method will be generated based on the
/// structure of the RecordMap. For testing purposes, a file name may be passed in the pStream argument.
ClassMethod PutObject(pStream As %IO.DeviceStream, pObject As %RegisteredObject, pFlush As %Boolean = 1, ByRef pPadArray As %String) As %Status
{
	Try {
		Set tStatus = $$$OK
		If '$IsObject(pStream) {
			Set tFilename = pStream
			Set pStream = ##class(%IO.FileStream).%New()
			Do pStream.Open(tFilename,"WAE",,"UTF-8", .tStatus)
			If $$$ISERR(tStatus) Quit
		}
		Set tHasTopFields = $parameter(pObject,"INCLUDETOPFIELDS")
		Set pStream.CharEncoding = "UTF-8"

		Set tStatus = ..PutRecord(pStream, pObject, tHasTopFields, .pPadArray)
		If $$$ISERR(tStatus) Quit
		If pFlush Do pStream.Flush(.tStatus)
		If $$$ISERR(tStatus) Quit
	}
	Catch ex {
		Set tStatus = ex.AsStatus()
	}
	Quit tStatus
}

/// Internal helper method to perform parse of incoming data
ClassMethod GetRecord(pStream As %IO.DeviceStream, pObject As %RegisteredObject, pGetTopFields As %Boolean, pTimeout As %Numeric, ByRef pLookAhead As %String = "", pLabelFound As %Boolean = 0) As %Status [ Internal, Private ]
{
	Set tStatus = $$$OK
	If pLabelFound { Set tRecLabel = "" } 
	Else { Set tRecLabel = "INFDOC;" } 
	Set tStatus = ..chunkRecord(pStream, .tRecordData, .tCharCount, "", pTimeout, $char(13,10), tRecLabel, .pLookAhead, "")
	If $$$ISERR(tStatus) Quit tStatus
	Set tMaxLocal = $$$MaxLocalLength
	Set tRecordData("charcount") = +$get(tCharCount)
	Set tCurrChunk = 1
	Set tTopPiece = 1
	Set tCurrSep = 1
	Set tStrings = 1
	Set tCurrString = ""
	Set tSeps = $listbuild($char(59))
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(59), tTopPiece)
	}
	Else {
		Set tCurrString = tRecordData(tCurrChunk)
		Set tCurrPiece = 1
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(59), .tTopPiece)
	If pGetTopFields {
		Set pObject.numDocument = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(59), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(59), .tTopPiece)
	If pGetTopFields {
		Set pObject.dateDocument =  pObject.dateDocumentDisplayToLogical(tCurrString)
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(59), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(59), .tTopPiece)
	If pGetTopFields {
		Set pObject.dateExpedition =  pObject.dateExpeditionDisplayToLogical(tCurrString)
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(59), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(59), .tTopPiece)
	If pGetTopFields {
		Set pObject.numBL = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(59), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(59), .tTopPiece)
	If pGetTopFields {
		Set pObject.PIVA = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(59), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(59), .tTopPiece)
	If pGetTopFields {
		Set pObject.devise = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(59), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(59), .tTopPiece)
	If pGetTopFields {
		Set pObject.codeClient = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(59), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(59), .tTopPiece)
	If pGetTopFields {
		Set pObject.transporteur = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(59), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(59), .tTopPiece)
	If pGetTopFields {
		Set pObject.condizioniDiPagamento = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(59), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(59), .tTopPiece)
	If pGetTopFields {
		Set pObject.TPXX = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(59), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(59), .tTopPiece)
	If pGetTopFields {
		Set pObject.delaiPaiement = tCurrString
	}
	If '$data(tRecordData(tCurrChunk, "block")) {
		Set tCurrString = $piece(tRecordData(tCurrChunk), $char(59), tTopPiece)
	}
	Do ..checkMerge(.tCurrChunk, .tRecordData, .tCurrString, $char(59), .tTopPiece)
	If pGetTopFields {
		Set pObject.dueDatePaiement = tCurrString
	}
	Quit tStatus
}

/// Internal helper method to output object to a stream
ClassMethod PutRecord(pStream As %IO.DeviceStream, pObject As %RegisteredObject, pHasTopFields As %Boolean, ByRef pPadArray As %String) As %Status [ Internal, Private ]
{
	Set tStatus = $$$OK
	Set tmpStream=##class(%Stream.TmpBinary).%New()
	Set tStatus = tmpStream.Write("INFDOC;")
	If $$$ISERR(tStatus) Quit tStatus
	Do tmpStream.Write($select(pHasTopFields: pObject.numDocument,1: ""))
	Do tmpStream.Write($char(59) _ $select(pHasTopFields: pObject.dateDocumentLogicalToDisplay(pObject.dateDocument),1: ""))
	Do tmpStream.Write($char(59) _ $select(pHasTopFields: pObject.dateExpeditionLogicalToDisplay(pObject.dateExpedition),1: ""))
	Do tmpStream.Write($char(59) _ $select(pHasTopFields: pObject.numBL,1: ""))
	Do tmpStream.Write($char(59) _ $select(pHasTopFields: pObject.PIVA,1: ""))
	Do tmpStream.Write($char(59) _ $select(pHasTopFields: pObject.devise,1: ""))
	Do tmpStream.Write($char(59) _ $select(pHasTopFields: pObject.codeClient,1: ""))
	Do tmpStream.Write($char(59) _ $select(pHasTopFields: pObject.transporteur,1: ""))
	Do tmpStream.Write($char(59) _ $select(pHasTopFields: pObject.condizioniDiPagamento,1: ""))
	Do tmpStream.Write($char(59) _ $select(pHasTopFields: pObject.TPXX,1: ""))
	Do tmpStream.Write($char(59) _ $select(pHasTopFields: pObject.delaiPaiement,1: ""))
	Do tmpStream.Write($char(59) _ $select(pHasTopFields: pObject.dueDatePaiement,1: ""))
	Set tStatus = tmpStream.Write($char(13,10))
	If $$$ISERR(tStatus) Quit tStatus
	Do pStream.CopyFrom(tmpStream,,0,.tStatus)
	Quit tStatus
}

ClassMethod GetGeneratedClasses(Output pClasses As %String) As %Status
{
	Kill pClasses
	Set pClasses("EDICOM.out.INFDOC.Record")=""
	Set pClasses($classname())=""
	Quit $$$OK
}

ClassMethod getIdentifier() As %String [ CodeMode = expression ]
{
"INFDOC;"
}

ClassMethod getType() As EnsLib.RecordMap.Model.DataType.RecordType [ CodeMode = expression ]
{
"delimited"
}

XData RecordMap [ XMLNamespace = "http://www.intersystems.com/Ensemble/RecordMap" ]
{
<Record xmlns="http://www.intersystems.com/Ensemble/RecordMap" name="EDICOM.out.INFDOC" type="delimited" char_encoding="UTF-8" targetClassname="EDICOM.out.INFDOC.Record" complexBatchManaged="1" label="INFDOC;" padFromLeft="0" recordTerminator="\x0d\x0a" allowEarlyTerminator="0">
  <Separators>
    <Separator>;</Separator>
  </Separators>
  <Field name="numDocument" required="1" ignored="0" datatype="%String" params="MAXLEN=&quot;&quot;" repeating="0">
    <annotation>num facture</annotation>
  </Field>
  <Field name="dateDocument" required="0" ignored="0" datatype="%Date" params="FORMAT=8" repeating="0">
    <annotation>date expédition</annotation>
  </Field>
  <Field name="dateExpedition" required="0" ignored="0" datatype="%Date" params="FORMAT=8" repeating="0">
    <annotation>date d'expédition</annotation>
  </Field>
  <Field name="numBL" required="0" ignored="0" datatype="%String" params="MAXLEN=&quot;&quot;" repeating="0">
    <annotation>Bon livraison associé à la facture</annotation>
  </Field>
  <Field name="PIVA" required="0" ignored="0" datatype="%String" repeating="0">
    <annotation>num TVA du client sur facture</annotation>
  </Field>
  <Field name="devise" required="0" ignored="0" datatype="%String" params="MAXLEN=&quot;&quot;" repeating="0">
    <annotation>sur facture champ devisa</annotation>
  </Field>
  <Field name="codeClient" required="0" ignored="0" datatype="%String" params="MAXLEN=&quot;&quot;" repeating="0">
    <annotation>code compta pragma client</annotation>
  </Field>
  <Field name="transporteur" required="0" ignored="0" datatype="%String" params="MAXLEN=&quot;&quot;" repeating="0">
    <annotation>sur fiche commande champ transporteur</annotation>
  </Field>
  <Field name="condizioniDiPagamento" required="0" ignored="0" datatype="%String" params="MAXLEN=&quot;&quot;" repeating="0">
    <annotation>facture</annotation>
  </Field>
  <Field name="TPXX" required="0" ignored="0" datatype="%String" repeating="0">
  </Field>
  <Field name="delaiPaiement" required="0" ignored="0" datatype="%String" repeating="0">
    <annotation>depuis cond paiement</annotation>
  </Field>
  <Field name="dueDatePaiement" required="0" ignored="0" datatype="%String" params="MAXLEN=&quot;&quot;" repeating="0">
    <annotation>facture</annotation>
  </Field>
</Record>
}

}
