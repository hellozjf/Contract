<%@include file="../emxUICommonHeaderBeginInclude.inc"%>
<%@include file="../emxUICommonAppInclude.inc"%>
<%@page import="com.matrixone.apps.common.Issue"%>
<%@page import="com.matrixone.apps.domain.DomainObject"%>
<%@page import="matrix.db.Context"%>
<%@page import="matrix.db.MQLCommand"%>
<%@page import="matrix.util.MatrixException"%>
<%@page import="com.matrixone.apps.domain.util.MqlUtil"%>
<%
  try{
    String oid = request.getParameter("objectId");
    DomainObject domainObject = DomainObject.newInstance(context, oid);
    MQLCommand mql = new MQLCommand();
    String cmd;
    
    // set signature pass
    cmd = "reject bus " + oid + " signature \"approve\";";
    mql.executeCommand(context, cmd);
    cmd = "approve bus " + oid + " signature \"reject\";";
    mql.executeCommand(context, cmd);
    
    cmd = "promote bus " + oid + ";";
    mql.executeCommand(context, cmd);
    String str = mql.getError();
    System.out.println(str);
  }catch(Exception e){
    e.printStackTrace();
  } 
%>
<script language="javascript" type="text/javaScript">
  top.refreshTablePage();
</script>
