<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="com.ubbi.common.util.Parameter"%>
<%@ page import="com.ubbi.common.util.HttpUtils"%>
<%@ page import="com.ubbi.common.config.user.UserSession"%>
<%@ page import="com.ubbi.common.config.ConfigHolder"%>
<%@ page import="com.ubbi.common.util.DataList"%>
<%@include file="/WEB-INF/pages/common/include/pageTagLibs.jsp"%>
<jsp:include flush="true" page="/WEB-INF/pages/common/include/pageMain.jsp" />
<title></title>

<script type="text/javascript">
	//windowStyle option 

	$(document).ready(function() {
		/* Desktoptemp = WshShell.Specialfolders("Desktop"); //path
		var sIconNm = "바탕화면테스트"; //바탕 화면에 생성될 아이콘 명.
		var sName = WshShell.CreateShortcut(Desktoptemp + "\\" + sIconNm + ".URL");
		sName.TargetPath = "http://hscstyle.web-bi.net";
		sName.WindowStyle = 3;
		sName.IconLocation = iConLocation;
		sName.Description = "Shortcut Script";
		sName.WorkingDirectory = "C:\\Program Files\\Internet Explorer";
		sName.Arguments = "http://localhost:9090"
		sName.Save();
 		*/
		
 		
		var iconLocation = "C:\\Users\\Public\\ShortcutIcon.ico"; // ico파일을 생성할 위치와 파일 이름
		var linkName = "\\IE1.lnk"; //바탕화면에 생성할 링크 이름. 앞에 있는 \\지우지 말고 뒤에 부분만 수정해서 쓰세요.
		
		var wsc = new ActiveXObject("Scripting.FileSystemObject"); // fileSystem check할 ActiveX Object 생성

		var WshShell = new ActiveXObject("WScript.Shell");  // 바로가기 만들 쉘 생성
		var strDesktop = WshShell.SpecialFolders("Desktop"); // 데스크탑 경로
		
		
		if(!wsc.FileExists(iconLocation)){
			WshShell.Run("bitsadmin /transfer iconDown http://localhost:9090/favicon.ico " + iconLocation); //ICO 파일 다운로드
		}else{
			alert("Icon Source Exsist");
		}
		
		if(!wsc.FileExists(strDesktop + linkName)){
			
			<%-- Properties Description
				WorkingDirectory 	- 시작 위치 디렉토리
									  (.lnk파일 속성메뉴 클릭시 시작 위치 부분에 들어갈 값)
				
				TargetPath 			- 실행할 파일명
									  (대상 위치에 들어갈 값)
				
				WindowStyle			- 링크 실행시에 화면 사이즈 지정
									  (실행 위치에 선택값)
									   3=Maximized 7=Minimized  4=Normal
				
				IconLocation		- 링크 아이콘에 표시되 ico 파일의 위치
									  (아이콘 변경메뉴에 매칭될 값)
				Description 		- 설명
				
				Arguments 			- TargetPath에 파일이 실행될때 접속할 url
									  (대상 위치에 TargetPath가 들어가고 그 뒤에 붙는 값)
									  익스로 바로가기를 만들면 원래는 WorkingDirectory값 + TargetPath만 들어감
									  이 속성에 값을 주면 그 뒤로 붙는 값이 됨
									  지난번 바로가기 만들기 예제의 경우에서
									  "C:\Program Files\Internet Explorer\iexplore.exe" http://localhost:9090 중 http://localhost:9090
			--%>
									  
			var oShellLink = WshShell.CreateShortcut(strDesktop + linkName); //쉘이용해서 바로가기 생성
			oShellLink.WorkingDirectory = "C:\\Program Files\\Internet Explorer"; 
			oShellLink.TargetPath = 'iexplore.exe'; //
			oShellLink.WindowStyle = 3;
			oShellLink.IconLocation = iconLocation;
			oShellLink.Description = "Shortcut Script";
			oShellLink.Arguments = "http://localhost:9090"
			oShellLink.Save();
		}else{
			alert("Link File Exsist");
		}
	})

	function open_ShortCut(urlShortcut) {
		
		
	}
</script>
<body>
	클릭
	<a href="javascript:open_ShortCut()">요기</a>

</body>
</html>