from flask import Flask, render_template, request
from os import path
from ctypes import *

data_type = (c_int*66)
func = CDLL(path.abspath('knight.so'))
app = Flask(__name__)


top = '''<!DOCTYPE html>
<html>
<title>Knight's Tour</title>
<head>
	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Expires" content="0" />
	<link href="https://fonts.googleapis.com/css2?family=Josefin+Slab:wght@300&display=swap" rel="stylesheet"> 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		$(window).on('beforeunload', function(){
			$(window).scrollTop(0);
		});
		$(document).ready(function() {
			$(window).scroll(function() {
				windowWidth = $(window).width();
				windowHeight = $(window).height();
				fs = Math.min(windowWidth, windowHeight);
				$( "#title" ).css("opacity", 1 - fop($(document).scrollTop(), 0));
				$( "#d0" ).css("font-size", ffff($(document).scrollTop(), 0, fs));
				$( "#d0" ).css("opacity", fop($(document).scrollTop(), 0));
				$( "#d1" ).css("font-size", ffff($(document).scrollTop(), 1, fs));
				$( "#d1" ).css("opacity", fop($(document).scrollTop(), 1));
				$( "#d2" ).css("font-size", ffff($(document).scrollTop(), 2, fs));
				$( "#d2" ).css("opacity", fop($(document).scrollTop(), 2));
				$( "#d3" ).css("font-size", ffff($(document).scrollTop(), 3, fs));
				$( "#d3" ).css("opacity", fop($(document).scrollTop(), 3));
				$( "#d4" ).css("font-size", ffff($(document).scrollTop(), 4, fs));
				$( "#d4" ).css("opacity", fop($(document).scrollTop(), 4));
				$( "#d5" ).css("font-size", ffff($(document).scrollTop(), 5, fs));
				$( "#d5" ).css("opacity", fop($(document).scrollTop(), 5));
				$( "#d6" ).css("font-size", ffff($(document).scrollTop(), 6, fs));
				$( "#d6" ).css("opacity", fop($(document).scrollTop(), 6));
				$( "#d7" ).css("font-size", ffff($(document).scrollTop(), 7, fs));
				$( "#d7" ).css("opacity", fop($(document).scrollTop(), 7));
				$( "#d8" ).css("font-size", ffff($(document).scrollTop(), 8, fs));
				$( "#d8" ).css("opacity", fop($(document).scrollTop(), 8));
				$( "#d9" ).css("font-size", ffff($(document).scrollTop(), 9, fs));
				$( "#d9" ).css("opacity", fop($(document).scrollTop(), 9));
				$( "#d10" ).css("font-size", ffff($(document).scrollTop(), 10, fs));
				$( "#d10" ).css("opacity", fop($(document).scrollTop(), 10));
				$( "#d11" ).css("font-size", ffff($(document).scrollTop(), 11, fs));
				$( "#d11" ).css("opacity", fop($(document).scrollTop(), 11));
				$( "#d12" ).css("font-size", ffff($(document).scrollTop(), 12, fs));
				$( "#d12" ).css("opacity", fop($(document).scrollTop(), 12));
				$( "#d13" ).css("font-size", ffff($(document).scrollTop(), 13, fs));
				$( "#d13" ).css("opacity", fop($(document).scrollTop(), 13));
				$( "#d14" ).css("font-size", ffff($(document).scrollTop(), 14, fs));
				$( "#d14" ).css("opacity", fop($(document).scrollTop(), 14));
				$( "#d15" ).css("font-size", ffff($(document).scrollTop(), 15, fs));
				$( "#d15" ).css("opacity", fop($(document).scrollTop(), 15));
				$( "#d16" ).css("font-size", ffff($(document).scrollTop(), 16, fs));
				$( "#d16" ).css("opacity", fop($(document).scrollTop(), 16));
				$( "#d17" ).css("font-size", ffff($(document).scrollTop(), 17, fs));
				$( "#d17" ).css("opacity", fop($(document).scrollTop(), 17));
				$( "#d18" ).css("font-size", ffff($(document).scrollTop(), 18, fs));
				$( "#d18" ).css("opacity", fop($(document).scrollTop(), 18));
				$( "#d19" ).css("font-size", ffff($(document).scrollTop(), 19, fs));
				$( "#d19" ).css("opacity", fop($(document).scrollTop(), 19));
				$( "#d20" ).css("font-size", ffff($(document).scrollTop(), 20, fs));
				$( "#d20" ).css("opacity", fop($(document).scrollTop(), 20));
				$( "#d21" ).css("font-size", ffff($(document).scrollTop(), 21, fs));
				$( "#d21" ).css("opacity", fop($(document).scrollTop(), 21));
				$( "#d22" ).css("font-size", ffff($(document).scrollTop(), 22, fs));
				$( "#d22" ).css("opacity", fop($(document).scrollTop(), 22));
				$( "#d23" ).css("font-size", ffff($(document).scrollTop(), 23, fs));
				$( "#d23" ).css("opacity", fop($(document).scrollTop(), 23));
				$( "#d24" ).css("font-size", ffff($(document).scrollTop(), 24, fs));
				$( "#d24" ).css("opacity", fop($(document).scrollTop(), 24));
				$( "#d25" ).css("font-size", ffff($(document).scrollTop(), 25, fs));
				$( "#d25" ).css("opacity", fop($(document).scrollTop(), 25));
				$( "#d26" ).css("font-size", ffff($(document).scrollTop(), 26, fs));
				$( "#d26" ).css("opacity", fop($(document).scrollTop(), 26));
				$( "#d27" ).css("font-size", ffff($(document).scrollTop(), 27, fs));
				$( "#d27" ).css("opacity", fop($(document).scrollTop(), 27));
				$( "#d28" ).css("font-size", ffff($(document).scrollTop(), 28, fs));
				$( "#d28" ).css("opacity", fop($(document).scrollTop(), 28));
				$( "#d29" ).css("font-size", ffff($(document).scrollTop(), 29, fs));
				$( "#d29" ).css("opacity", fop($(document).scrollTop(), 29));
				$( "#d30" ).css("font-size", ffff($(document).scrollTop(), 30, fs));
				$( "#d30" ).css("opacity", fop($(document).scrollTop(), 30));
				$( "#d31" ).css("font-size", ffff($(document).scrollTop(), 31, fs));
				$( "#d31" ).css("opacity", fop($(document).scrollTop(), 31));
				$( "#d32" ).css("font-size", ffff($(document).scrollTop(), 32, fs));
				$( "#d32" ).css("opacity", fop($(document).scrollTop(), 32));
				$( "#d33" ).css("font-size", ffff($(document).scrollTop(), 33, fs));
				$( "#d33" ).css("opacity", fop($(document).scrollTop(), 33));
				$( "#d34" ).css("font-size", ffff($(document).scrollTop(), 34, fs));
				$( "#d34" ).css("opacity", fop($(document).scrollTop(), 34));
				$( "#d35" ).css("font-size", ffff($(document).scrollTop(), 35, fs));
				$( "#d35" ).css("opacity", fop($(document).scrollTop(), 35));
				$( "#d36" ).css("font-size", ffff($(document).scrollTop(), 36, fs));
				$( "#d36" ).css("opacity", fop($(document).scrollTop(), 36));
				$( "#d37" ).css("font-size", ffff($(document).scrollTop(), 37, fs));
				$( "#d37" ).css("opacity", fop($(document).scrollTop(), 37));
				$( "#d38" ).css("font-size", ffff($(document).scrollTop(), 38, fs));
				$( "#d38" ).css("opacity", fop($(document).scrollTop(), 38));
				$( "#d39" ).css("font-size", ffff($(document).scrollTop(), 39, fs));
				$( "#d39" ).css("opacity", fop($(document).scrollTop(), 39));
				$( "#d40" ).css("font-size", ffff($(document).scrollTop(), 40, fs));
				$( "#d40" ).css("opacity", fop($(document).scrollTop(), 40));
				$( "#d41" ).css("font-size", ffff($(document).scrollTop(), 41, fs));
				$( "#d41" ).css("opacity", fop($(document).scrollTop(), 41));
				$( "#d42" ).css("font-size", ffff($(document).scrollTop(), 42, fs));
				$( "#d42" ).css("opacity", fop($(document).scrollTop(), 42));
				$( "#d43" ).css("font-size", ffff($(document).scrollTop(), 43, fs));
				$( "#d43" ).css("opacity", fop($(document).scrollTop(), 43));
				$( "#d44" ).css("font-size", ffff($(document).scrollTop(), 44, fs));
				$( "#d44" ).css("opacity", fop($(document).scrollTop(), 44));
				$( "#d45" ).css("font-size", ffff($(document).scrollTop(), 45, fs));
				$( "#d45" ).css("opacity", fop($(document).scrollTop(), 45));
				$( "#d46" ).css("font-size", ffff($(document).scrollTop(), 46, fs));
				$( "#d46" ).css("opacity", fop($(document).scrollTop(), 46));
				$( "#d47" ).css("font-size", ffff($(document).scrollTop(), 47, fs));
				$( "#d47" ).css("opacity", fop($(document).scrollTop(), 47));
				$( "#d48" ).css("font-size", ffff($(document).scrollTop(), 48, fs));
				$( "#d48" ).css("opacity", fop($(document).scrollTop(), 48));
				$( "#d49" ).css("font-size", ffff($(document).scrollTop(), 49, fs));
				$( "#d49" ).css("opacity", fop($(document).scrollTop(), 49));
				$( "#d50" ).css("font-size", ffff($(document).scrollTop(), 50, fs));
				$( "#d50" ).css("opacity", fop($(document).scrollTop(), 50));
				$( "#d51" ).css("font-size", ffff($(document).scrollTop(), 51, fs));
				$( "#d51" ).css("opacity", fop($(document).scrollTop(), 51));
				$( "#d52" ).css("font-size", ffff($(document).scrollTop(), 52, fs));
				$( "#d52" ).css("opacity", fop($(document).scrollTop(), 52));
				$( "#d53" ).css("font-size", ffff($(document).scrollTop(), 53, fs));
				$( "#d53" ).css("opacity", fop($(document).scrollTop(), 53));
				$( "#d54" ).css("font-size", ffff($(document).scrollTop(), 54, fs));
				$( "#d54" ).css("opacity", fop($(document).scrollTop(), 54));
				$( "#d55" ).css("font-size", ffff($(document).scrollTop(), 55, fs));
				$( "#d55" ).css("opacity", fop($(document).scrollTop(), 55));
				$( "#d56" ).css("font-size", ffff($(document).scrollTop(), 56, fs));
				$( "#d56" ).css("opacity", fop($(document).scrollTop(), 56));
				$( "#d57" ).css("font-size", ffff($(document).scrollTop(), 57, fs));
				$( "#d57" ).css("opacity", fop($(document).scrollTop(), 57));
				$( "#d58" ).css("font-size", ffff($(document).scrollTop(), 58, fs));
				$( "#d58" ).css("opacity", fop($(document).scrollTop(), 58));
				$( "#d59" ).css("font-size", ffff($(document).scrollTop(), 59, fs));
				$( "#d59" ).css("opacity", fop($(document).scrollTop(), 59));
				$( "#d60" ).css("font-size", ffff($(document).scrollTop(), 60, fs));
				$( "#d60" ).css("opacity", fop($(document).scrollTop(), 60));
				$( "#d61" ).css("font-size", ffff($(document).scrollTop(), 61, fs));
				$( "#d61" ).css("opacity", fop($(document).scrollTop(), 61));
				$( "#d62" ).css("font-size", ffff($(document).scrollTop(), 62, fs));
				$( "#d62" ).css("opacity", fop($(document).scrollTop(), 62));
				$( "#d63" ).css("font-size", ffff($(document).scrollTop(), 63, fs));
				$( "#d63" ).css("opacity", fop($(document).scrollTop(), 63));
			});
		});

		function fop(x, offset) {
			time_d = 400.0;
			if (x <= offset*time_d) {
				return 0.0;
			}
			else if (x <= ((offset+1)*time_d)){
				return (x - (offset*time_d))/(time_d);
				// alert((x - (offset*time_d))/(time_d))
			} 
			else {
				return 1.0;
			}
		}

		function ffff(x, offset, fs) {
			time_d = 400.0;
			c1 = 1.70158;
			c3 = c1 + 1;
			max_size = Math.floor(fs/37);
			if (x <= offset*time_d) {
				return 0;
			}
			else if (x <= (offset+1)*time_d) {
				return (max_size) * 
					(
						1 + 
						c3 * Math.pow(
							(((x-(offset*time_d))/time_d) - 1), 3
						) + 
						c1 * Math.pow(
							(((x-(offset*time_d))/time_d) - 1), 2
						)
					) + 
					max_size;
			} 
			else {
				return 2*max_size;
			}
		}
	</script>
<style>
td {
	font-size: 0px;
	height: 11.5%;
	width: 11.5%;
	text-align: center;
	vertical-align: middle;
	position: relative;
	border-radius: min(1vh,1vw);
	border: min(0.25vh, 0.25vw) solid #c1a695;
	opacity: 0;
}
.black {
	background-color: #765a4a;
	color: #edd8cd;
}
.white {
	background-color: #edd8cd;
	color: #765a4a;
}
.middle_fade {
	align-content: center;
	vertical-align: middle;
	top: 50%;
	left: 50%;
	align-self: center;
	transform: translate(-50%, -50%);
}
body {
	background-color: #c1a695; 
	height: 28000px;
	font-family: 'Josefin Slab';
}
table {
	position: fixed;
	width: min(95vw, 95vh);
	height: min(95vw, 95vh);
}
h1 {
	text-align: center;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-size: max(5vw, 5vh);
	color: #765a4a;
	position: absolute;
}
	</style>
</head>
<body>
	<table class="middle_fade">
'''

bottom = '''</table>
	<a href="/info">
		<h1 id="title"><u>Knight's Tour</u></h1>
	</a>
</body>
'''

@app.route('/info')
def info():
	return '''
<!DOCTYPE html>
<html>
	<title>Knight's Tour</title>
<head>
	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Expires" content="0" />
	<link href="https://fonts.googleapis.com/css2?family=Josefin+Slab:wght@300&display=swap" rel="stylesheet"> 
	<style>
td {
	font-size: 0px;
	height: 11.5%;
	width: 11.5%;
	text-align: center;
	vertical-align: middle;
	position: relative;
	border-radius: min(1vh,1vw);
	border: min(0.25vh, 0.25vw) solid #c1a695;
	opacity: 0;
}
body {
	background-color: #c1a695; 
	font-family: 'Josefin Slab';
	color: #765a4a;
}
table {
	position: fixed;
	width: min(95vw, 95vh);
	height: min(95vw, 95vh);
}
h1 {
	text-align: center;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-size: max(5vw, 5vh);
	position: absolute;
}
a {
	color: #765a4a;
}
p{
	max-width: 100vh;
	text-align: justified;
	font-size: 8vh;
}
</style>

</head>
<body>
<center>
<p>The Knight's Tour Problem:<br><br>

Can a Knight visit every square on a chess board exactly once, and finish where it started? <br><br>This website generates random Knight's Tours using a neural network. For more information, visit <a href="https://github.com/amanj120/knights_tour">my GitHub</a>.</p>
<a href="/">
		<p><u>Back</u></p>
	</a>
</center>

</body>
''';

@app.route('/')
def home():
	nums = data_type()
	func.run(nums)
	s = top
	bw = 0
	for i in range(8):
		s += "<tr>"
		bw += 1;
		for j in range(8):
			s += '\t<td id="d{}" class="{}">{}</td>'.format(nums[i*8+j]-1,"white" if bw%2 == 1 else "black", nums[i*8+j])
			bw += 1;
		s += "</tr>" 
	s += bottom
	return s;

if __name__ == '__main__':
	app.run(debug=True)