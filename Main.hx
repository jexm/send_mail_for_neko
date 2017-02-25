

class Main {
	
	static function main() {
		//trace("send mail init....");
		var params=neko.Web.getParams();
		var _to=params.get("to");
		var _title=params.get("title");
		var _text=params.get("text");
		var _attach=params.get("attach");
		if(_to==""||_to==null){
			neko.Lib.println("to null");
			return;
		}
		var r = ~/[A-Z0-9._%-]+@[A-Z0-9.-]+.[A-Z][A-Z][A-Z]?/i;
		if(!r.match(_to)){
			neko.Lib.println("is not the email format");
			return;
		}
		if(_title==""||_title==null){
			neko.Lib.println("title null");
			return;
		}
		if(_text==""||_text==null){
			neko.Lib.println("text null");
			return;
		}
		var _mailerServer={
			host:"smtp.163.com", 
			port:25, 
			user:"gdstmjx@163.com", 
			pass:"gdstmjx8888" 
		};
		var mailer = new ufront.mailer.SmtpMailer(_mailerServer);
		var sendMailContent = new ufront.mail.Email();
		var from="gdstmjx@163.com";
		var to=_to;
		sendMailContent.from(from);
		sendMailContent.to(to);
		sendMailContent.setSubject(_title);
		sendMailContent.setText(_text);
		sendMailContent.setCharset("utf-8");

		if(_attach!=""&&_attach!=null){
			sendMailContent.attach("attach","attach.txt",haxe.io.Bytes.ofString(_attach));
		}
		
		var res = mailer.send(sendMailContent);
		if(Std.string(res)=="#function:1"){
			neko.Lib.println("send finish");
		}else{
			neko.Lib.println("send error");
		}
	}
	
}
