var xhReq = new XMLHttpRequest();
xhReq.open("GET", "/api/lecture_attendance.do", false);
xhReq.send(null);
var data = JSON.parse(xhReq.responseText);

var rankLists;
let timerId;
let updateInterval = 5000;


function ascending(a, b) { return a.point > b.point ? 1 : -1; }
function descending(a, b) {
  if (Number(a.point) === Number(b.point)) {
    const titleA = a.title.toLowerCase();
    const titleB = b.title.toLowerCase();
    const koreanCompare = titleA.localeCompare(titleB, "ko-KR");
    return koreanCompare;
  }
  return Number(a.point) < Number(b.point) ? 1 : -1;
}


function reposition() {
    const height = $(".rankTable .rank").height();
    let y = height;

    for(var i = 0; i < rankLists.length; i++) {
        rankLists[i].$item.css("top", y + "px");
        y += height;
    }
}

function updateRanks(list) {
    for(var i = 0; i < list.length; i++) {
        list[i].$item.find(".rank").text(i + 1);
    }
}

function fetchNewData(data,attributeName,name){
    for(let x in data){
        if((data[x].title === name) === true) {
            return data[x][attributeName];
        }
    }
    return null;
}

function updateBoard() {
    var rank = getRandomCoin();
    rank.point += getRandomScoreIncrease();
    rank.$item.find(".point").text(rank.point);
    rankLists.sort(descending);
    updateRanks(rankLists);
    reposition();
}

function getNewData(){
    // get the new data for each coin and change to their new values
    var newReq = new XMLHttpRequest();
    newReq.open("GET", "/api/lecture_attendance.do", false);
    newReq.send(null);
    var newData = JSON.parse(newReq.responseText);
    console.log(newData);
    for(var i = 0; i < newData.length; i++) {
        var rank = rankLists[i];
        // 기존 데이터

        if ($(`.rank:contains('${newData[i].title}')`). length > 0) {
            rank.point = fetchNewData(newData,'point',rank.title);
            rank.$item.find(".rankPrice").text(Number(rank.point).toLocaleString());
            
        } else {
        // 새로운 데이터
        var $list = $(".rankLists");
        var $item = $(
            "<tr class='rank'>" +
                "<td class='rankiPrize 1st'>"+ (i+1) +"</td>" +
                "<td class='rankName'>" + newData[i].title + "</td>" +
                "<td class='rankPrice'>" + Number(newData[i].point).toLocaleString() + "</td>" +
            "</tr>"
        );
        rankLists.push(
            {
                title : newData[i].title,
                point : Number(newData[i].point),
                $item : $item
            }
        )
        $list.append($item);
        }
    }

    rankLists.sort(descending);
    rankLists = rankLists.filter((rank, i) => {
        if (i >= 10) {
            rank.$item.remove();
        } else {
            return true;
        }
    });
	
    for(var i = 0; i < rankLists.length; i++) {
        var rank = rankLists[i];

        if (i === 0) {
			rank.$item.find(".rankiPrize").html(`
            	<td class='rankiPrize'><img src='../../../../../../front_img/1.webp' alt=''></td>
            `);
		} else if (i === 1) {
			rank.$item.find(".rankiPrize").html(`
            	<td class='rankiPrize'><img src='../../../../../../front_img/2.webp' alt=''></td>
            `);
		} else if (i === 2) {
			rank.$item.find(".rankiPrize").html(`
            	<td class='rankiPrize'><img src='../../../../../../front_img/3.webp' alt=''></td>
            `);
		} else {
			rank.$item.find(".rankiPrize").html(`
            	<td class='rankiPrize ect' style="display:flex; justify-content: flex-end; width: 100%; padding-right: 13px;">${i + 1}</td>
            `);
		}
    }
    updateRanks(rankLists);
    reposition();
    console.log('Finished retrieving new data');

}

function getRandomScoreIncrease() {
    return getRandomBetween(50, 150);
}
function getRandomBetween(minimum, maximum) {
        return Math.floor(Math.random() * maximum) + minimum;
}

function resetBoard() {
    var $list = $(".rankLists");
    $list.find(".rank").remove();
    if(timerId !== undefined) {
        clearInterval(timerId);
    }
    rankLists = [];
    for(let i = 0;i < data.length; i++){
        rankLists.push(
            {
                title : data[i].title,
                point : Number(data[i].point)
            }
        )
    }
	rankLists.sort(descending);
    for(var i = 0; i < rankLists.length; i++) {
        //console.log(rankLists[i])
		if (i === 0) {

	        var $item = $(
	            "<tr class='rank'>" +
	                "<td class='rankiPrize 1st'><img src='../../../../../../front_img/1.webp' alt=''></td>" +
	                "<td class='rankName'>" + rankLists[i].title + "</td>" +
	                "<td class='rankPrice'>" + rankLists[i].point.toLocaleString() + "</td>" +
	            "</tr>"
	        );
	        rankLists[i].$item = $item;

        	$list.append($item);
		} else if (i === 1) {
	        var $item = $(
	            "<tr class='rank'>" +
	                "<td class='rankiPrize 1st'><img src='../../../../../../front_img/2.webp' alt=''></td>" +
	                "<td class='rankName'>" + rankLists[i].title + "</td>" +
	                "<td class='rankPrice'>" + rankLists[i].point.toLocaleString() + "</td>" +
	            "</tr>"
	        );
	        rankLists[i].$item = $item;

        	$list.append($item);
		} else if (i === 2) {
	        var $item = $(
	            "<tr class='rank'>" +
	                "<td class='rankiPrize 1st'><img src='../../../../../../front_img/3.webp' alt=''></td>" +
	                "<td class='rankName'>" + rankLists[i].title + "</td>" +
	                "<td class='rankPrice'>" + rankLists[i].point.toLocaleString() + "</td>" +
	            "</tr>"
	        );
	        rankLists[i].$item = $item;

        	$list.append($item);
		} else {
	        var $item = $(
	            "<tr class='rank'>" +
	                "<td class='rankiPrize 1st'>"+ (i+1) +"</td>" +
	                "<td class='rankName'>" + rankLists[i].title + "</td>" +
	                "<td class='rankPrice'>" + rankLists[i].point.toLocaleString() + "</td>" +
	            "</tr>"
	        );
	        rankLists[i].$item = $item;

        	$list.append($item);
		}
    }
    //rankLists.sort(descending);
    updateRanks(rankLists);
    reposition();

    // fetch new data for the updateInterval
    timerId = setInterval("getNewData();", updateInterval);

}
resetBoard()
//window.addEventListener("load", resetBoard);