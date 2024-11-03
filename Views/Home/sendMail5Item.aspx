<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="sendMail5Item.aspx.cs" Inherits="AdminGunny.Admin.sendMail5Item" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        
        .style1445
        {
            min-height: 935px;
            
        }
        .style1448
        {
            background: #C4C4C4;
            text-align: center;
            height: 30px;
            width: 895px;
        }
        .style1450
        {
             display:none;
        }
        .style1451
        {
            background: #15222E;
            width: 80px;
            text-align: center;
            height: 30px;
            cursor:pointer;
            color: #B0D551;
        }
        
        .style1453
        {
            width: 200px;
            text-align: center;
            height: 30px;
            background: #C4C4C4;
            cursor: pointer;
            color: #B0D551;
        }
        .style1454
        {
            border: thin #000080;
            width: 503px;
        }
        .style1455
        {
            width: 503px;
            color: #003366;
            font-size: medium;
        }
        .style1457
        {
            width: 170px;
        }
        .style1458
        {
            width: 493px;
            height: 200px;
        }
        .style1462
        {
            width: 100%;
        }
        .style1463
        {
            width: 165px;
            height: 110px;
        }
        .style1464
        {
            height: 110px;
        }
        .style1465
        {
            color: #003366;
        }
        .style1466
        {
            border: thin #000080 solid;
            width: 100%;
            height: 110px;
        }
        .style1468
        {
            text-align: center;
            height: 30px;
            color: #B0D551;
            background-color: #15222E;
            cursor: pointer;
        }
        .style1469
        {
            height: 473px;
            border: thin #000080 solid;
            width: 410px;
            padding-left: 7px;
            padding-right: 6px;
        text-align: left;
    }
        .style1470
        {
            height: 110px;
            text-align: center;
            font-size: large;
            color: #000080;
        }
        .style1471
        {
            border: thin #000080 solid;
            width: 30%;
        }
        .style1473
        {
            text-align: center;
            height: 40px;
            font-size: large;
        }
        .style1474
        {
            text-align: right;
            height: 25px;
        }
        .style1475
        {
            text-align: right;
            height: 25px;
            width: 121px;
        }
        .style1476
        {
            height: 570px;
            width: 1057px;
        }
        .style1477
        {
            width: 71px;
            height: 31px;
            font-size: medium;
            font-weight: bold;
            color: #003366;
        }
        .style1478
        {
            height: 25px;
            width: 539px;
            margin-top: 2px;
            margin-left: 0px;
            padding-left: 0px;
        }
        
        
        .style1479
        {
            min-width: 194px;
            background-color: #006699;
            color: #FFFFFF;
            padding:10px 10px 10px 10px;
            display:none;
            position:absolute;
            top:40%;
            left:40%;
            z-index:455;
        }
        
        
        .style1480
        {
            height: 37px;
            width: 84px;
            color: #FFFFFF;
            font-size: 17px;
            font-weight: bold;
            background-color: #003399;
        }
        
        
        .style1481
        {
            border: thin #000080;
            width: 503px;
            height: 30px;
            color: #003366;
        }
        .style1482
        {
            width: 367px;
            height: 22px;
        }
        
        
        .style1483
        {
            width: 100px;
            height: 20px;
        }
        
        
        .style1484
        {
            width: 110px;
            background-image: url('../Images/default.png');
            background-repeat: no-repeat;
            background-position: center;
            text-align: center;
        }
        
        
        .style1485
        {
            background: #15222E;
            width: 90px;
            text-align: center;
            height: 30px;
            cursor: pointer;
            color: #B0D551;
        }
        
        
        </style>
        <script type="text/javascript">
            var btn_close = '<p style="width: 100%; height:18px; text-align:center;"><a style="font-size: 15px; font-weight: bold;" href="javascript:void(0);" onclick="hide_customitem();">[Fexar]</a></p>';
            
            //some function here
                       
            function custom_Items(slotIDs, keys) {
                var HiddenItem = $("#HiddenItem" + slotIDs);
                var msgbox = $("#custom_ItemsContent");
                //show loading....
                msgbox.html('<img src="../Images/uber-loading.gif"/>');
                if (HiddenItem.val() != "") {
                    $.ajax({
                        type: 'GET',
                        url: 'customItem.aspx',
                        data: 'IDs=' + HiddenItem.val() + '&keys=' + keys + ',' + slotIDs,
                        success: function (data) {
                            show_customitem();
                            $('#custom_ItemsContent').html(data);

                        }
                    });
                }
                else {
                    show_customitem();
                    $('#custom_ItemsContent').html("Slot " + slotIDs + " nenhum item não pôde opcional!" + btn_close);
                }
            }
            
            function call_checkcount(count, getIDs) {
                var maxmincount = parseInt($("#TxtCount").val());
                var HiddenCount = $("#HiddenCount" + getIDs);
                if (maxmincount < 1) {
                    $("#miniPanelContent").html("Nhỏ nhất là 1.");
                    tb_showMiniPanel();
                } else if (maxmincount > count) {
                    $("#miniPanelContent").html("Lớn nhất là " + count + ".");
                    tb_showMiniPanel();
                }
                else {
                    if ($("#TxtCount").val() != '') {
                        var digits = "0123456789";
                        var temp;
                        for (var i = 0; i < $("#TxtCount").val().length; i++) {
                            temp = $("#TxtCount").val().substring(i, i + 1);
                            if (digits.indexOf(temp) == -1) {
                                //alert("Please enter correct zip code");
                                $("#miniPanelContent").html("Você deve digitar um número de 0-9! ");
                                tb_showMiniPanel();
                                $("#TxtCount").focus();
                                $("#TxtCount").val("");
                                return false;
                            }
                        }
                        hide_printTBCount();
                        HiddenCount.val(maxmincount);
                    } else { $("#miniPanelContent").html("Você não inseriu quantidade!"); tb_showMiniPanel(); return false; }


                }

            }
            function printTBCount(count, getIDs) {
                var container = '<div id="get_count" style=" width: 147px; height: 72px; background-color: #006699;">';
                container += '<table style="width: 145px; height: 70px;"><tr>';
                container += '<td style="width: 79px; height: 30px; color: #FFFFFF;">';
                container += 'Số Lượng:</td><td style="height: 30px; text-align: center;">';
                container += '<input id="TxtCount" style="width: 50px; text-align: center;" value="1" type="text" /></td>';
                container += '</tr><tr><td class="style15" colspan="2">';
                container += '<input id="Bt_checkcount" onclick="call_checkcount(' + count + ', ' + getIDs + ');" type="button" value="Editar" /></td>';
                container += '</tr></table></div>';
                $("#printTBCount").html(container);
                show_printTBCount();
            }
				function getQueryVariable(variable) {
				  var query = window.location.search.substring(1);
				  var vars = query.split("&");
				  for (var i=0;i<vars.length;i++) {
					var pair = vars[i].split("=");
					if (pair[0] == variable) {
					window.location="http://ww2.gamesnexus.com.br/admin/sendMail5Item.aspx";
					  return pair[1];
					}
				  } 
				}
            function call_addItems(GoodIDs, count) {
                //start function

                var msgbox;
                var errors = 0;
                var HiddenItem1 = $("#HiddenItem1");
                var HiddenItem2 = $("#HiddenItem2");
                var HiddenItem3 = $("#HiddenItem3");
                var HiddenItem4 = $("#HiddenItem4");
                var HiddenItem5 = $("#HiddenItem5");
              
                if (HiddenItem1.val() == "") {
                    HiddenItem1.val(GoodIDs)
                    msgbox = $("#td_item1");
                    if (count > 1) {
                      printTBCount(count, 1);
                   } else {$("#HiddenCount1").val("1"); }
              }

                else if (HiddenItem2.val() == "") {
                    HiddenItem2.val(GoodIDs)
                    msgbox = $("#td_item2");
                    if (count > 1) {
                        printTBCount(count, 2);
                    } else { $("#HiddenCount2").val("1"); }
                }
                else if (HiddenItem3.val() == "") {
                    HiddenItem3.val(GoodIDs)
                    msgbox = $("#td_item3");
                    if (count > 1) {
                        printTBCount(count, 3);
                    } else { $("#HiddenCount3").val("1"); }
                }
                else if (HiddenItem4.val() == "") {
                    HiddenItem4.val(GoodIDs)
                    msgbox = $("#td_item4");
                    if (count > 1) {
                        printTBCount(count, 4);
                    } else { $("#HiddenCount4").val("1"); }
                }
                else if (HiddenItem5.val() == "") {
                    HiddenItem5.val(GoodIDs)
                    msgbox = $("#td_item5");
                    if (count > 1) {
                        printTBCount(count, 5);
                    } else { $("#HiddenCount5").val("1"); }
                }
                else {
                    errors = 1;
                    msgbox = $("#miniPanelContent");
                    msgbox.html("Item de anexar um máximo de 5 itens! chegou ao finito declarado....")
                    //msgbox.html(HiddenItem1.val() + "|" + HiddenItem2.val() + "|" + HiddenItem3.val() + "|" + HiddenItem4.val() + "|" + HiddenItem5.val())
                    tb_showMiniPanel();

                }
                //show loading....
                if (errors == 0) {
                    msgbox.html('<img src="../Images/uber-loading.gif"/>');
                    //request data
                    var $j = jQuery;
                    $j.ajax({
                        type: "POST",
                        url: "mainRequest.ashx/AddItemsMail",
                        data: "{GoodIDs:" + GoodIDs + ",Keys:'7.0.0.0.0.0',isPopup:1}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (message) {
                            //show data
                            msgbox.html(message.d);
                            //tb_showsearchPanel();
                        },
                        error: function (errormessage) {
                            //show error
                            msgbox.html(errormessage.responseText);
                        }

                    });
                    //end function  
                }
            }
            function clearForm() {
                $('#mainForm').resetForm();
                $("#TextArea1").val("");
                $("#TxtTitle").val("");
                var getParam;
                for (var s = 1; s < 6; s++) {
                    getParam = $("#HiddenCount" + s);
                    getParam.val("1");
                    getParam = $("#HiddenValid" + s);
                    getParam.val("7");
                    getParam = $("#HiddenStreng" + s);
                    getParam.val("0");
                    getParam = $("#HiddenAttack" + s);
                    getParam.val("0");
                    getParam = $("#HiddenDefend" + s);
                    getParam.val("0");
                    getParam = $("#HiddenAgility" + s);
                    getParam.val("0");
                    getParam = $("#HiddenLuck" + s);
                    getParam.val("0");
                    del_ItemsAtt(s);
                }
            }
            function call_SendMail() {
                //start function
                var selectedBind = $("#SelectBind option:selected").val();
                var TxtContent = $("#TextArea1").val();
                var TxtUserName = $("#TxtUserName").val();
                var TxtTitle = $("#TxtTitle").val();
                var getParam;
                var MainParam = "";
				var erro=0;
                for (var s = 1; s < 6; s++) {
                    getParam = $("#HiddenItem" + s);
		if(getParam.val()==15075 || getParam.val()==312508){
			erro=1;
			clearForm();
		}
                    MainParam += getParam.val() + ",";
                    getParam = $("#HiddenCount" + s);
                    MainParam += getParam.val() + ",";
                    getParam = $("#HiddenValid" + s);
                    MainParam += getParam.val() + ",";
                    getParam = $("#HiddenStreng" + s);
                    MainParam += getParam.val() + ",";
                    getParam = $("#HiddenAttack" + s);
                    MainParam += getParam.val() + ",";
                    getParam = $("#HiddenDefend" + s);
                    MainParam += getParam.val() + ",";
                    getParam = $("#HiddenAgility" + s);
                    MainParam += getParam.val() + ",";
                    getParam = $("#HiddenLuck" + s);
                    MainParam += getParam.val() + ",";
                    MainParam += selectedBind + "|";
                }
                if ($("#HiddenItem1").val()=="" && $("#HiddenItem2").val()=="" && $("#HiddenItem3").val()=="" && $("#HiddenItem4").val()=="" && $("#HiddenItem5").val()=="") {
                MainParam = "";
                }
                
                tb_showMiniPanel();
                var msgbox = $("#miniPanelContent");
                //show loading....
				if(erro==0){
                if (TxtUserName == "") {
                    msgbox.html('Você não recebeu Usuário!');
                }
                else {
                    msgbox.html('<img src="../Images/uber-loading.gif"/>');

                    //request data
                    var $j = jQuery;
                    $j.ajax({
                        type: "POST",
                        url: "mainRequest.ashx/SendMailByAdmin",
                        data: "{title:'" + TxtTitle + "', content:'" + TxtContent + "', UserName:'" + TxtUserName + "', param:'" + MainParam + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (message) {
                            clearForm();
                            //show data
                            msgbox.html(message.d);

                        },
                        error: function (errormessage) {
                            //show error
                            msgbox.html(errormessage.responseText);
                        }

                    });
                } //end function
            }
			else{
			 var msgbox = $("#miniPanelContent");
			 msgbox.html('Asa 15075 proibida!');
			 tb_showMiniPanel();
			}
			}
			function call_SendMail1() {
                //start function
                var selectedBind = $("#SelectBind option:selected").val();
                var TxtContent = $("#TextArea1").val();
                var TxtUserName = $("#TxtNickName").val();
                var TxtTitle = $("#TxtTitle").val();
                var getParam;
                var MainParam = "";
				var erro=0;
                for (var s = 1; s < 6; s++) {
                    getParam = $("#HiddenItem" + s);
		if(getParam.val()==15075 || getParam.val()==312508){
			erro=1;
			clearForm();
		}
                    MainParam += getParam.val() + ",";
                    getParam = $("#HiddenCount" + s);
                    MainParam += getParam.val() + ",";
                    getParam = $("#HiddenValid" + s);
                    MainParam += getParam.val() + ",";
                    getParam = $("#HiddenStreng" + s);
                    MainParam += getParam.val() + ",";
                    getParam = $("#HiddenAttack" + s);
                    MainParam += getParam.val() + ",";
                    getParam = $("#HiddenDefend" + s);
                    MainParam += getParam.val() + ",";
                    getParam = $("#HiddenAgility" + s);
                    MainParam += getParam.val() + ",";
                    getParam = $("#HiddenLuck" + s);
                    MainParam += getParam.val() + ",";
                    MainParam += selectedBind + "|";
                }
                if ($("#HiddenItem1").val()=="" && $("#HiddenItem2").val()=="" && $("#HiddenItem3").val()=="" && $("#HiddenItem4").val()=="" && $("#HiddenItem5").val()=="") {
                MainParam = "";
                }
                
                tb_showMiniPanel();
                var msgbox = $("#miniPanelContent");
                //show loading....
				if(erro==0){
                if (TxtUserName == "") {
                    msgbox.html('Você não recebeu Usuário!');
                }
                else {
                    msgbox.html('<img src="../Images/uber-loading.gif"/>');

                    //request data
                    var $j = jQuery;
                    $j.ajax({
                        type: "POST",
                        url: "mainRequest.ashx/SendMailByAdmin1",
                        data: "{title:'" + TxtTitle + "', content:'" + TxtContent + "', UserName:'" + TxtUserName + "', param:'" + MainParam + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (message) {
                            clearForm();
                            //show data
                            msgbox.html(message.d);

                        },
                        error: function (errormessage) {
                            //show error
                            msgbox.html(errormessage.responseText);
                        }

                    });
                } //end function
            }
			else{
			 var msgbox = $("#miniPanelContent");
			 msgbox.html('Asa 15075 proibida!');
			 tb_showMiniPanel();
			}
			}
            

            function call_sendMoney() {
                //start function
                tb_showMiniPanel();
                var msgbox = $("#miniPanelContent");
                var UserName = String($("#TxtUserMoney").val());
                var Gold = parseInt($("#TxtGold").val());
                var Money = parseInt($("#TxtMoney").val());
                var GiftToken = parseInt($("#TxtGiftToken").val());
                //show loading....
                msgbox.html('<img src="../Images/uber-loading.gif"/>');
                //request data
                if (UserName == "") {
                    msgbox.html("Você não inseriu conta");

                }

                else if (Gold == "") {
                    msgbox.html("Você não digitou Ouro");

                }
                else if (Money == "") {
                    msgbox.html("Você não digitou Cupom");

                }
                else if (GiftToken == "") {
                    msgbox.html("Você não digitou ..");

                }
                else {
                    //msgbox.html(UserName + Gold + Money + GiftToken)

                    var $j = jQuery;
                    $j.ajax({
                        type: "POST",
                        url: "mainRequest.ashx/SendMoney",
                        data: "{UserName:'" + UserName + "', Gold:" + Gold + ", Money:" + Money + ", GiftToken:" + GiftToken + "}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (message) {
                            //show data
                            $("#TxtUserMoney").val("");
                            $("#TxtGold").val("");
                            $("#TxtMoney").val("");
                            $("#TxtGiftToken").val("");

                            msgbox.html(message.d);
                        },
                        error: function (errormessage) {
                            //show errorerrormessage.responseText
                            msgbox.html("de 0-9");
                        }

                    });
                    //end function  
                }
            }
            function show_Sendmail() {
                $("#divSendMail").css({ display: "block" });
                $("#divSendMoney").css({ display: "none" });
                $("#divMailBox").css({ display: "none" });

            }
            function show_SendMoney() {
                $("#divSendMail").css({ display: "none" });
                $("#divSendMoney").css({ display: "block" });
                $("#divMailBox").css({ display: "none" });
                $("#TxtUserMoney").focus();
            }
            function show_MailBox() {
                $("#divSendMail").css({ display: "none" });
                $("#divSendMoney").css({ display: "none" });
                $("#divMailBox").css({ display: "block" });
            }
            function show_MailBox() {
                $("#divSendMail").css({ display: "none" });
                $("#divSendMoney").css({ display: "none" });
                $("#divMailBox").css({ display: "block" });
            }
            
        </script>
		

<script language="JavaScript">    
    var msg = 'Função desativada!';
    //ESSAS SERÃO AS TECLAS DESABILITADAS
    var asciiF2        = 113;
    var asciiF3        = 114;
    var asciiF4        = 115;
    var asciiF5        = 116;
    var asciiF6        = 117;
    var asciiF11        = 122;
    var asciiF12        = 123;
    var asciiF1        = 112;
    
    if(document.all){ //ie has to block in the key down
        document.onkeydown = onKeyPress;
    }else if (document.layers || document.getElementById){ //NS and mozilla have to block in the key press
        document.onkeypress = onKeyPress;
    }
    
    function onKeyPress(evt) {
        DDTankIIow.status = '';
        //get the event object
        var oEvent = (DDTankIIow.event) ? DDTankIIow.event : evt;
      
        //hmmm in mozilla this is jacked, so i have to record these seperate
        //what key was pressed
        var nKeyCode =  oEvent.keyCode ? oEvent.keyCode : oEvent.which ? oEvent.which : void 0;
        var bIsFunctionKey = false;
    
        //hmmm in mozilla the keycode would contain a function key ONLY IF the charcode IS 0  
        //else key code and charcode read funny, the charcode for 't'
        //returns 116, which is the same as the ascii for F5
        //SOOO,... to check if a the keycode is truly a function key,
        //ONLY check when the charcode is null OR 0, IE returns null, mozilla returns 0
        if(oEvent.charCode == null || oEvent.charCode == 0){
            bIsFunctionKey = (nKeyCode >= asciiF1 && nKeyCode <= asciiF12)
    ||
                                (
                                    nKeyCode == asciiALT
                                    || nKeyCode == asciiMS
                                    || nKeyCode == asciiView
                                    || nKeyCode == asciiHome
                                    || nKeyCode == asciiBack
                                )
        }
      
        //convert the key to a character, makes for more readable code
        var sChar = String.fromCharCode(nKeyCode).toUpperCase();
    
        //get the active tag that has the focus on the page, and its tag type
        var oTarget = (oEvent.target) ? oEvent.target : oEvent.srcElement;
        var sTag = oTarget.tagName.toLowerCase();
        var sTagType = oTarget.getAttribute("type");
      
        var bAltPressed = (oEvent.altKey) ? oEvent.altKey : oEvent.modifiers & 1 > 0;
        var bShiftPressed = (oEvent.shiftKey) ? oEvent.shiftKey : oEvent.modifiers & 4 > 0;
        var bCtrlPressed = (oEvent.ctrlKey) ? oEvent.ctrlKey : oEvent.modifiers & 2 > 0;
        //var bMetaPressed = (oEvent.metaKey) ? oEvent.metaKey : oEvent.modifiers & 8 > 0;
    
        var bRet = true; //assume true as that will be the case most times
        //alert (nKeyCode + ' ' + sChar + ' ' + sTag + ' ' + sTagType + ' ' + bShiftPressed + ' ' + bCtrlPressed + ' ' + bAltPressed);
    
        if(sTagType != null){sTagType = sTagType.toLowerCase();}
    
        //allow these keys inside a text box
        if  (sTag == "textarea" || (sTag == "input" && (sTagType == "text" || sTagType == "password")) && (nKeyCode == asciiBack || nKeyCode == asciiSHIFT || KeyCode == asciiHome || bShiftPressed || (bCtrlPressed && (nKeyCode == asciiLeftArrow || nKeyCode == asciiRightArrow)))){
            return true;
        } else if(bAltPressed && (nKeyCode == asciiLeftArrow || nKeyCode == asciiRightArrow)){ // block alt + left or right arrow
            bRet = false;
        }else if(bCtrlPressed && (sChar == 'A' || sChar == 'C' || sChar == 'V' || sChar == 'X')){ // ALLOW cut, copy and paste, and SELECT ALL
            bRet = true;
        }else if(bShiftPressed && nKeyCode == asciiTab){//allow shift + tab
            bRet = true;
        }else if(bIsFunctionKey){ // Capture and stop these keys
            bRet = false;
        }else if(bCtrlPressed || bShiftPressed || bAltPressed){ //block ALL other sequences, includes CTRL+O, CTRL+P, CTRL+N, etc....
            bRet = false;
        }
      
        if(!bRet){
            try{
                oEvent.returnValue = false;
                oEvent.cancelBubble = true;
    
                if(document.all){ //IE
                    oEvent.keyCode = 0;
                }else{ //NS
                    oEvent.preventDefault();
                    oEvent.stopPropagation();
                }
                //DDTankIIow.status = msg;
      alert(msg);
            }catch(ex){
                alert(msg);
            }
        }
        return bRet;
    }
</script>		
		
		
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="custom_ItemsContent" class="style1479" >

</div>
    <div class="style1445">
    <table  style="width:100%;">
        <tr>
            <td class="style1485" 
            onclick="show_Sendmail();"
            onmouseout="$(this).css({ background: '#15222E', color: '#B0D551'});" 
            onmouseover="$(this).css({ background: '#2C2c2B', color: '#FFFFFF'});">
             Enviar Itens
                </td>
				<td  class="style1485" onclick="show_SendMoney();"  onmouseout="$(this).css({ background: '#15222E', color: '#B0D551'});" 
            onmouseover="$(this).css({ background: '#2C2c2B', color: '#FFFFFF'});">
Enviar Cupons
</td>
<td class="style1485">Pesquisar Item<input type="text" id="pesquisa" name="pesquisa"></input><a href="#" onclick="loading_ItemIcon3(document.getElementById('pesquisa').value,1,true)">Pesquisar</a></td>
                
            <td class="style1453">
            
            
 
            

            
            
                
                </td>
            <td class="style1448">

        </tr>
        <tr>
            <td colspan="4">
                <div id="divSendMail" class="style1476">
                    <table style="border: medium #000080 solid; width: 100%;">
                        <tr>
                            <td class="style1454">
                                <span class="style1465">Seu NickName:&nbsp;</span>&nbsp;&nbsp;
                                <input type="text" class="style1457" id="TxtNickName" value="<%=Request.Form["nickname"]%>" /><br>
								<span class="style1465">Seu Login:&nbsp;</span>&nbsp;&nbsp;
                                <input type="text" class="style1457" id="TxtUserName" value="<%=Request.Form["username"]%>" /></td>
                            <td rowspan="6">
                            <table style="width: 537px;">
                    <tr>
                        <td style="width: 414px;">
                                <div id="list_Items" class="style1469">
                                
                                </div>
                                </td>
                        <td valign="top">
                            <asp:Label ID="ShowLoadMenu" runat="server" Text="" />
                            </td>
                            </tr>
                </table>
                                <div id="show_smartpaginator" class="style1478" ></div>

                            </td>
                        </tr>
                        <tr>
                            <td class="style1481">
                             Assunto:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             <input type="text" class="style1482" id="TxtTitle" value="DDHermanos v8.7" /></td>
                        </tr>
                        <tr>
                            <td class="style1454">
                                <span class="style1465">Conteúdo: </span></td>
                        </tr>
                        <tr>
                            <td class="style1454">
                                <textarea rows="" cols="" id="TextArea1" class="style1458" name="DDTankDDTankII">DDTankII</textarea></td>
                        </tr>
                        <tr>
                            <td class="style1455">
                                <strong>Anexos de itens: </strong>
                                <select id="SelectBind" class="style1483" name="D1">
                                    <option value="true">Bloquear</option>
                                    <option value="false">Não Bloquear</option>
                                </select> 
                                </td></tr>
                        <tr>
                            <td class="style1454">
                                <table cellpadding="0" cellspacing="0" class="style1462">
                                    <tr>
                                        <td class="style1463">
                                            <table class="style1466">
                                                <tr>
                                                    <td id="td_item1" class="style1484" rowspan="2">
                                                        Item 1</td>
                                                    <td class="style1468"
                                                    onclick="del_ItemsAtt(1);"
                                                    onmouseout="$(this).css({ background: '#15222E', color: '#B0D551'});" 
                                                    onmouseover="$(this).css({ background: '#2C2c2B', color: '#FFFFFF'});">
                                                        Excluir</td>
                                                </tr>
                                                <tr>
                                                    <td class="style1468"
                                                    onclick="custom_Items(1, 'customItems');"
                                                    onmouseout="$(this).css({ background: '#15222E', color: '#B0D551'});" 
                                                    onmouseover="$(this).css({ background: '#2C2c2B', color: '#FFFFFF'});">
                                                        Opções</td>
                                                </tr>       
                                                </table>
                                        </td>
                                        <td class="style1463">
                                            <table class="style1466">
                                                <tr>
                                                    <td id="td_item2" class="style1484" rowspan="2">
                                                        Item 2</td>
                                                    <td class="style1468"
                                                    onclick="del_ItemsAtt(2);"
                                                    onmouseout="$(this).css({ background: '#15222E', color: '#B0D551'});" 
                                                    onmouseover="$(this).css({ background: '#2C2c2B', color: '#FFFFFF'});">
                                                        Excluir</td>
                                                </tr>
                                                <tr>
                                                    <td class="style1468"
                                                    onclick="custom_Items(2, 'customItems');"
                                                    onmouseout="$(this).css({ background: '#15222E', color: '#B0D551'});" 
                                                    onmouseover="$(this).css({ background: '#2C2c2B', color: '#FFFFFF'});">
                                                        Opções</td>
                                                </tr>
                                                </table>
                                        </td>
                                        <td class="style1464">
                                            <table class="style1466">
                                                <tr>
                                                    <td id="td_item3" class="style1484" rowspan="2">
                                                        Item 3</td>
                                                    <td class="style1468"
                                                    onclick="del_ItemsAtt(3);"
                                                    onmouseout="$(this).css({ background: '#15222E', color: '#B0D551'});" 
                                                    onmouseover="$(this).css({ background: '#2C2c2B', color: '#FFFFFF'});">
                                                        Excluir</td>
                                                </tr>
                                                <tr>
                                                    <td class="style1468"
                                                    onclick="custom_Items(3, 'customItems');"
                                                    onmouseout="$(this).css({ background: '#15222E', color: '#B0D551'});" 
                                                    onmouseover="$(this).css({ background: '#2C2c2B', color: '#FFFFFF'});">
                                                        Opções</td>
                                                </tr>
                                                </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style1463">
                                            <table class="style1466">
                                                <tr>
                                                    <td id="td_item4" class="style1484" rowspan="2">
                                                        Item 4</td>
                                                    <td class="style1468"
                                                    onclick="del_ItemsAtt(4);"
                                                    onmouseout="$(this).css({ background: '#15222E', color: '#B0D551'});" 
                                                    onmouseover="$(this).css({ background: '#2C2c2B', color: '#FFFFFF'});">
                                                        Excluir</td>
                                                </tr>
                                                <tr>
                                                    <td class="style1468"
                                                    onclick="custom_Items(4, 'customItems');"
                                                    onmouseout="$(this).css({ background: '#15222E', color: '#B0D551'});" 
                                                    onmouseover="$(this).css({ background: '#2C2c2B', color: '#FFFFFF'});">
                                                        Opções</td>
                                                </tr>
                                          </table>
                                        </td>
                                        <td class="style1463">
                                            <table class="style1466">
                                                <tr>
                                                    <td id="td_item5" class="style1484" rowspan="2">
                                                        Item 5</td>
                                                    <td class="style1468"
                                                    onclick="del_ItemsAtt(5);"
                                                    onmouseout="$(this).css({ background: '#15222E', color: '#B0D551'});" 
                                                    onmouseover="$(this).css({ background: '#2C2c2B', color: '#FFFFFF'});">
                                                        Excluir</td>
                                                </tr>
                                                <tr>
                                                    <td class="style1468"
                                                    onclick="custom_Items(5, 'customItems');"
                                                    onmouseout="$(this).css({ background: '#15222E', color: '#B0D551'});" 
                                                    onmouseover="$(this).css({ background: '#2C2c2B', color: '#FFFFFF'});">
                                                        Opções</td>
                                                </tr>
                                          </table>
                                        </td>
                                        <td class="style1470" style="min-width: 40px;">
                                            <br />
                                      <input onclick="call_SendMail();" id="Button1" type="button" value="Enviar por Login" class="style1480" style="
    min-width: 150px;
" /><br>
									  <input onclick="call_SendMail1();" id="Button2" type="button" value="Enviar por NickName" class="style1480" style="
    min-width: 150px;
" /></td>

                                    </tr>
                                    </table>
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="divSendMoney" class="style1450">
                    <table class="style1471">
                        <tr>
                            <td class="style1475">
                                <span class="style1465">NickName:</span></td>
                            <td class="style1474">
                            <input id="TxtUserMoney" class="style1457" type="text" value="<%=Request.Form["nickname"]%>" /></td>
                        </tr>
                        <tr>
                            <td class="style1475">
                            <span class="style1465">Xu (Money):</span></td>
                            <td class="style1474">
                            <input id="TxtMoney" value="" class="style1457" type="text" /></td>
                        </tr>
                        <tr>
                            <td class="style1475">
                            <span class="style1465">Vàng (Gold):</span></td>
                            <td class="style1474">
                            <input id="TxtGold" value="" class="style1457" type="text" /></td>
                        </tr>
                        <tr>
                            <td class="style1475">
                            <span class="style1465">Lễ Kim (GifToken):</span></td>
                            <td class="style1474">
                            <input id="TxtGiftToken" value="" class="style1457" type="text" /></td>
                        </tr>
                        <tr>
                            <td class="style1473" colspan="2">
                                <strong>
                                <input id="TxtSend" onclick="call_sendMoney();" class="style1477" value="Send" type="button" /></strong></td>
                        </tr>
                    </table>
                                   
                </div>
               
                            
            </td>
        </tr>
    </table>
	
</div>   

</asp:Content>
