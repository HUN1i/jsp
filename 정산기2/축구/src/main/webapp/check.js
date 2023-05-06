function check(){
	if(document.frm.playername.value == ""){
		alert("선수이름이 없습니다")
		document.playername.focus()
		return false
	}
	else if(document.frm.position.value == ""){
		alert("포지션이 없습니다")
		document.position.focus()
		return false
	}
	else if(document.frm.playerdate.value == ""){
		alert("등록일이 없습니다")
		document.playerdate.focus()
		return false
	}
	else if(document.frm.teamid.value == ""){
		alert("소속팀이 없습니다")
		document.teamid.focus()
		return false
	}
}
function reset(){
	alert("취소되었습니다")
}