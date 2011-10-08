function initSpentTime(currentSpentTime)
{
    currentSpentTimeSplitted = (currentSpentTime).split(':');

    currentDateTime = new Date(); // TimedTrack(current_time);
    currentDateTime.setHours(parseInt(currentSpentTimeSplitted[0]),parseInt(currentSpentTimeSplitted[1]));

    spentTimeUpdateInterval = setInterval(
        'currentDateTime.setSeconds(currentDateTime.getSeconds()+1)',
        1000
    );
}

function updateCurrentSpentTimeElement()
{
    hours = fulfillNumber(currentDateTime.getHours());
    minutes = fulfillNumber(currentDateTime.getMinutes());

    currentSpentTimeString = hours+':'+minutes;
    $('activity-spent-time').update(currentSpentTimeString);
}

function fulfillNumber(number, decimalPoints)
{
    if(arguments.length == 1) decimalPoints = 2;

    decimalPointsDifference = decimalPoints-String(number).length;

    fulfillment = '';
    if(decimalPointsDifference>0)
    {
        for(i=0;i<decimalPointsDifference;i++)
        {
            fulfillment += '0';
        }
    }

    return fulfillment+String(number);
}
