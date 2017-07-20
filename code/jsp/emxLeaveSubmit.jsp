<%@include file="../emxUICommonHeaderBeginInclude.inc"%>
<%@include file="../emxUICommonAppInclude.inc"%>
<%@page import="com.matrixone.apps.common.Issue"%>
<%@page import="com.matrixone.apps.domain.DomainObject"%>
<%@page import="matrix.db.Context"%>
<%@page import="matrix.db.MQLCommand"%>
<%@page import="matrix.util.MatrixException"%>
<%@page import="com.matrixone.apps.domain.util.MqlUtil"%>
<%
	
	//String[] ids = emxGetParameterValues(request, "emxTableRowId");	
	//String[] arrTableRowIds = FrameworkUtil.getSplitTableRowIds(emxGetParameterValues(request, "emxTableRowId"));
	//String strObjectIds[] = Issue.getObjectIds(arrTableRowIds);
	//if (strObjectIds.length != 1) {
	//	System.out.println("zjfoutput: !=1");
	//	return;
	//}
//System.out.println(ids[0] + ":zjf0");
//System.out.println(arrTableRowIds[0] + ":zjf1");
//System.out.println(strObjectIds[0] + ":zjf2");
	try{
		//DomainObject.deleteObjects(context, ids);
		//DomainObject.deleteObjects(context, strObjectIds);
		String oid = request.getParameter("objectId");
		System.out.println("zjfoutput:" + oid);
		MQLCommand mql = new MQLCommand();
		String cmd = "promote bus " + oid + ";";
		mql.executeCommand(context, cmd);
		String str = mql.getError();
		if (null != str && !"".equals(str)) {
			System.out.println("zjfoutput: " + str);
		}
	}catch(Exception e){
		e.printStackTrace();
	} 
%>
<script language="javascript" type="text/javaScript">
	top.refreshTablePage();
</script>
