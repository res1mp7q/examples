/*
Copyright (C) 2013 electric imp, inc.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software 
and associated documentation files (the "Software"), to deal in the Software without restriction, 
including without limitation the rights to use, copy, modify, merge, publish, distribute, 
sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is 
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial 
portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE 
AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, 
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

/* 
 * Tom Buttner
 * tom@electricimp.com
 */

server.log("Sana Agent Running at "+http.agenturl());

codes <- {
	SAMSUNG_AA59_00600A = {
		START_TIME_HIGH 	= 4500,
		START_TIME_LOW 		= 4500,
		PULSE_TIME			= 600,
		TIME_LOW_1			= 1700,
		TIME_LOW_0			= 600,
		CARRIER				= 38000,
		PAUSE_BETWEEN_SENDS = 0.05,
		pwr					= "111000001110000001000000101111111",
		src 				= "111000001110000010000000011111111",
		one					= "111000001110000000100000110111111",
		two 				= "111000001110000010100000010111111",
		three 				= "111000001110000001100000100111111",
		four 				= "111000001110000000010000111011111",
		five 				= "111000001110000010010000011011111",
		six 				= "111000001110000001010000101011111",
		seven  				= "111000001110000000110000110011111",
		eight 				= "111000001110000010110000010011111",
		nine 				= "111000001110000001110000100011111",
		minus 				= "111000001110000011000100001110111",
		zero				= "111000001110000010001000011101111",
		pre_ch				= "111000001110000011001000001101111",
		vol_up				= "111000001110000011100000000111111",
		mute 				= "111000001110000011110000000011111",
		ch_up				= "111000001110000001001000101101111",
		vol_dn				= "111000001110000011010000001011111",
		ch_list				= "111000001110000011010110001010011",
		ch_dn 				= "111000001110000000001000111101111",
		media_p				= "111000001110000000110001110011101",
		menu				= "111000001110000001011000101001111",
		sleep				= "111000001110000011000000001111111",
		tools				= "111000001110000011010010001011011",
		up					= "111000001110000000000110111110011",
		info				= "111000001110000011111000000001111",
		left				= "111000001110000010100110010110011",
		enter				= "111000001110000000010110111010011",
		right				= "111000001110000001000110101110011",
		back				= "111000001110000000011010111001011",
		down				= "111000001110000010000110011110011",
		exit 				= "111000001110000010110100010010111",
		A					= "111000001110000000110110110010011",
		B					= "111000001110000000101000110101111",
		C					= "111000001110000010101000010101111",
		D					= "111000001110000001101000100101111",
		p_size				= "111000001110000001111100100000111",
		mts					= "111000001110000000000000111111111",
		cc					= "111000001110000010100100010110111",
		stop				= "111000001110000001100010100111011",
		rew					= "111000001110000010100010010111011",
		play				= "111000001110000011100010000111011",
		pause				= "111000001110000001010010101011011",
		ff					= "111000001110000000010010111011011"
	},

	SANYO_4VPIS4U = {
		START_TIME_HIGH 	= 3300,
		START_TIME_LOW		= 1700,
		PULSE_TIME 			= 420,
		TIME_LOW_1			= 1200,
		TIME_LOW_0			= 420,
		CARRIER				= 38000,
		PAUSE_BETWEEN_SENDS = 0.05,
		on 					= "000000100000000000101000000000010111011001000001010110000101011111000100000001100000110001001000001000000100000000000000000000000000000000000000100001101",
		off					= "000000100000000000101000000000010111011010000001010110000011011111000000000001100000110010100000001000000100000000000000000000000000000000000000010001101",
		one_hour			= "000000100000000000101000000000010111011001001001010110000101011111000100010100010000110001001000001110000100000000000000000000010000000000000000111011101",
		ion_on				= "000000100000000000101000000000010111011000001001011101001111101111000100010100010000110000011000001110000100000000001000000000000000000000000000101000011",
		ion_off 			= "000000100000000000101000000000010111011000001001010110000110011111000100010100010000110011001000001110000100000000000000000000000000000000000000010011101",
		set_temp_60			= "000000100000000000101000000000010111011000001001000110001000011111000100010100010000110011001000001110000100000000000000000000000000000000000000110101101",
		set_temp_62			= "000000100000000000101000000000010111011000001001010110001000011111000100010100010000110000101000001110000100000000000000000000000000000000000000011101101",
		set_temp_64			= "000000100000000000101000000000010111011000001001001110001000011111000100010100010000110000101000001110000100000000000000000000000000000000000000000011101",
		set_temp_66			= "000000100000000000101000000000010111011000001001011110001000011111000100010100010000110000101000001110000100000000000000000000000000000000000000010011101",
		set_temp_68 		= "000000100000000000101000000000010111011000001001000001001111101111000100010100010000110000101000001110000100000000000000000000000000000000000000010011101",
		set_temp_70			= "000000100000000000101000000000010111011000001001010001001111101111000100010100010000110010101000001110000100000000000000000000000000000000000000101011101",
		set_temp_72			= "000000100000000000101000000000010111011000001001001001001111101111000100010100010000110010101000001110000100000000000000000000000000000000000000111011101",
		set_temp_74			= "000000100000000000101000000000010111011000001001000101001101101111000100010100010000110001011000001110000100000000001000000000000000000000000000101111101",
		set_temp_76			= "000000100000000000101000000000010111011000001001010101000111101111000100010100010000110001101000001110000100000000000000000000000000000000000000101111101",
		set_temp_78			= "000000100000000000101000000000010111011000001001001101000111101111000100010100010000110001101000001110000100000000000000000000000000000000000000111111101",
		set_temp_80 		= "000000100000000000101000000000010111011000001001011101001111101111000100010100010000110001101000001110000100000000000000000000000000000000000000010000011",
		cancel 				= "000000100000000000101000000000010111011000001001011101001111101111000100010100010000110011101000001110000100000000000000000000000000000000000000110000011",
	},

	UNKNOWN = {

	}
}

selectedTarget <- "SANYO_4VPIS4U";

device.on("newcode", function(newcode) {
	local now = time();

	codes.UNKNOWN.now <- newcode;
	server.log("Got new IR Code ("+newcode.len()+"): "+newcode);
});

http.onrequest(function(request, res) {
    server.log("Agent got new HTTP Request");
    // we need to set headers and respond to empty requests as they are usually preflight checks
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers","Origin, X-Requested-With, Content-Type, Accept");
    res.header("Access-Control-Allow-Methods", "POST, GET, OPTIONS");

    if (request.path == "/sendcode") {
    	local code = request.body;
    	server.log(format("Agent Requested to send code, length "+code.len()));
    	res.send(200, "OK\n");
    	device.send("send_code",code);

    } else if (request.path == "/listdevices") {
    	local responsestr = "";
    	foreach(key, value in codes) {
    		responsestr += (key+"\n");
    	}
    	res.send(200, responsestr);
    } else if (request.path == "/selectdev") {
    	local targetdevice = request.body;

    	if (targetdevice in codes) {
    		server.log("Selecting Target Device: "+targetdevice);
    		selectedTarget = targetdevice;
    		device.send("set_timing", codes[targetdevice]);
    		res.send(200, "Selected Target Device: "+selectedTarget+"\n");
    	} else {
    		res.send(204, "Target device "+targetdevice+" is unknown.\n");
    	}

    } else if (request.path == "/getselecteddev") {
    	res.send(200, selectedTarget+"\n");
    } else if (request.path == "/sendcmd") {
    	local cmd = request.body;

    	if (cmd in codes[selectedTarget]) {
    		device.send("send_code", codes[selectedTarget][cmd]);
    		res.send(200, "Sent Command "+cmd+" to target device "+selectedTarget+".\n");
    	} else {
    		res.send(204, "No command "+cmd+" for target device "+selectedTarget+".\n");
    	}

    } else if (request.path == "/listcmds") {
    	local responsestr = "";
    	foreach (key, value in codes[selectedTarget]) {
    		responsestr += (key+"\n");
    	}
    	res.send(200, responsestr);
    } else {
        // send a generic response to prevent browser hang
        res.send(200, "OK\n");
    }
});