function check(){
	fn = document.frm
	if(fn.artistid.value === ""){
		alert("아이디가 없어요")
		fn.artistid.focus
		return false
		
	}
	if(fn.artistname.value === ""){
		alert("이름이 없어요")
		fn.artistname.focus
		return false
		
	}
	if(fn.year.value === ""){
		alert("생일이 없어요")
		fn.year.focus
		return false
		
	}
	if(fn.month.value === ""){
		alert("생일이 없어요")
		fn.month.focus
		return false
		
	}
	if(fn.day.value === ""){
		alert("생일이 없어요")
		fn.day.focus
		return false
		
	}
	if(fn.gender.value === ""){
		alert("성별이 없어요")
		fn.gender.focus
		return false
		
	}
	if(fn.talent.value === ""){
		alert("특기가 없어요")
		fn.talent.focus
		return false
		
	}
	if(fn.agency.value === ""){
		alert("anjsrk 없어요")
		fn.agency.focus
		return false
		
	}
	
}
function re(){
	alert("다시 작성합니다")
}