<%@include file="../emxUICommonHeaderBeginInclude.inc"%>
<%@include file="../emxUICommonAppInclude.inc"%>
<%@page import="com.matrixone.apps.common.Issue"%>
<%@page import="com.matrixone.apps.domain.DomainObject"%>
<%
	//String[] ids = emxGetParameterValues(request, "emxTableRowId");	
	String[] arrTableRowIds = FrameworkUtil.getSplitTableRowIds(emxGetParameterValues(request, "emxTableRowId"));
	String strObjectIds[] = Issue.getObjectIds(arrTableRowIds);
//System.out.println(ids[0] + ":zjf0");
//System.out.println(arrTableRowIds[0] + ":zjf1");
//System.out.println(strObjectIds[0] + ":zjf2");
	try{
		//DomainObject.deleteObjects(context, ids);
		DomainObject.deleteObjects(context, strObjectIds);
	}catch(Exception e){
		e.printStackTrace();
	} 
%>
<script language="javascript" type="text/javaScript">
	top.refreshTablePage();
</script>
