//全选反选
function CheckOthers(form) {
    for (var i = 0; i < form.selectid.length; i++) {
        var e = form.selectid[i];
        if (e.checked == false) {
            e.checked = true;
        }
        else {
            e.checked = false;
        }
    }
}

//全部执行(删除)
function ConfirmDel(message,url,deal) {
	if(deal=="delete"){
        if(confirm(message)){
		    document.form2.action=url;  
            document.form2.submit();
        }
	}else if(deal=="update"){
		document.form2.action=url;  
        document.form2.submit();
	}
}
