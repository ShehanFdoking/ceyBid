<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Place a Bid</title>
</head>
<body>
    <h1>Place a Bid</h1>
    <form action="PlaceBid" method="post">
        Buyer ID: <input type="text" name="buyerId" required><br>
        Item ID: <input type="text" name="itemId" required><br>
        Bid Amount: <input type="text" name="bidAmount" required><br>
        <input type="submit" value="Place Bid">
    </form>
</body>
</html>
