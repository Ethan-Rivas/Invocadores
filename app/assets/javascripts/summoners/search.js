function summonersSearch() {
    var SUMMONER_NAME = "";
    SUMMONER_NAME = $("#userName").val();

    var API_KEY = "";

    if (SUMMONER_NAME !== "") {

      window.location.href = "#/invocador/perfil/index";

        $.ajax({
            url: 'https://lan.api.pvp.net/api/lol/lan/v1.4/summoner/by-name/' + SUMMONER_NAME + '?api_key=' + API_KEY,
            type: 'GET',
            dataType: 'json',
            data: {

            },
            success: function (json) {
                var SUMMONER_NAME_NOSPACES = SUMMONER_NAME.replace(" ", "");

                SUMMONER_NAME_NOSPACES = SUMMONER_NAME_NOSPACES.toLowerCase().trim();

                summonerName = json[SUMMONER_NAME_NOSPACES].name;
                summonerLevel = json[SUMMONER_NAME_NOSPACES].summonerLevel;
                summonerID = json[SUMMONER_NAME_NOSPACES].id;
                summonerIcon = json[SUMMONER_NAME_NOSPACES].profileIconId;

                document.getElementById("sName").innerHTML = summonerName;
                document.getElementById("sLevel").innerHTML = summonerLevel;
                document.getElementById("sID").innerHTML = summonerID;
                document.getElementById("sIcon").innerHTML = summonerIcon;
                profileIcon = $('#summonerProfile').html('<img class="profileIcon" src="http://ddragon.leagueoflegends.com/cdn/6.5.1/img/profileicon/' + summonerIcon  + '.png"/>');

                  $.ajax({
                      url: 'https://lan.api.pvp.net/api/lol/lan/v2.5/league/by-summoner/' + summonerID + '/entry?api_key=' + API_KEY,
                      type: 'GET',
                      dataType: 'json',
                      data: {

                      },
                      success: function(json) {
                          tierName = json[summonerID][0].name;
                          tierNamed = json[summonerID][0].tier;
                          tierQueue = json[summonerID][0].queue;
                          tierDivision = json[summonerID][0].entries[0].division;

                          tierWins = json[summonerID][0].entries[0].wins;
                          tierLosses = json[summonerID][0].entries[0].losses;

                          document.getElementById("rankName").innerHTML = tierName;
                          document.getElementById("actRank").innerHTML = tierNamed;
                          document.getElementById("tierQueue").innerHTML = tierQueue;
                          document.getElementById("rankDivision").innerHTML = tierDivision;

                          document.getElementById("rankWins").innerHTML = tierWins;
                          document.getElementById("rankLosses").innerHTML = tierLosses;

                      },
                      error: function(XMLHttpRequest, textStatus, errorThrown) {
                          alert("error getting Summoner ranking!");
                      }
                    });

            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("error getting Summoner data!");
            }
        });
    } else {}
}
