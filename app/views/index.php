<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="/css/style.css">
        <title>Document</title>
    </head>
    <body>
    <div>
        <div>
            <h2>Выберите интервал:</h2>
            <form method="post" action="/index">
                <input type="date" name="dateAt">
                <input type="date" name="dateTo">
                <input type="submit">
            </form>
        </div>
        <div class="container">
            <?php if ($dateAt == '1970-01-01' || $dateTo == '1970-01-01'): ?>
            <div></div>
            <?php else: ?>
            <div class="date-con">
                Дата решения с <?= $dateAt?>
            </div>
            <div class="date-con">
                Дата решения по <?= $dateTo?>
            </div>
            <?php endif; ?>
        </div>
        <?php if (count($values) > 0): ?>
        <table>
            <thead>
            <tr>
                <th>ФИО</th>
                <th>Отключение</th>
                <th>Проверка/удешевление</th>
                <th>Тех.вопрос</th>
                <th>Прочее</th>
                <th>Всего</th>
            </tr>
            </thead>
            <tbody>
            <?php foreach ($values as $value): ?>
            <tr>
                <td>
                    <div><?= $value['surname'] ?> <?= $value['name'] ?></div>
                </td>
                <td><?= $value['disconnected'] ?></td>
                <td><?= $value['verification_cheapening'] ?></td>
                <td><?= $value['technical_issue'] ?></td>
                <td><?= $value['other'] ?></td>
                <td><?= $value['total'] ?></td>
            </tr>
            <?php endforeach; ?>
            </tbody>
        </table>
        <?php endif; ?>
    </div>
    </body>
</html>