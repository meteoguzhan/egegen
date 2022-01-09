<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title><?= $this->renderSection('title') ?></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

    <style>
        body main {
            padding-top: 60px;
        }
        .carousel .carousel-item {
            height: 600px;
        }

        .carousel-item img {
            min-height: 600px;
        }

        .navbar {
            padding: 0 !important;
        }

        .navbar-brand {
            padding: 0 !important;
        }

        .navbar-brand img {
            width: 70px;
        }
    </style>
</head>
<body>
<div class="header">
    <div class="row justify-content-md-center">
        <nav class="navbar navbar-expand-lg fixed-top navbar-light bg-light">
            <div class="container">
                <a class="navbar-brand" href="/"><img
                            src="https://egegen.com/upload/files/files_2019-07-18_13-52-37.png"/></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="/">Anasayfa <span class="sr-only">(current)</span></a>
                        </li>
                        <?php
                            $menu = new \App\Models\Menu();
                            $menuItems = $menu->where('status', 1)->where('parent_id', 0)->findAll();
                            foreach ($menuItems as $result) : ?>
                                <?php
                                $childMenus = $menu->where('parent_id', $result['id'])->findAll();
                                if (count($childMenus)) : ?>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="/<?php echo $result['slug'] ?>"
                                           id="navbarDropdown" role="button"
                                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <?php echo $result['name'] ?>
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <?php foreach ($childMenus as $childMenu) : ?>
                                                <a class="dropdown-item"
                                                   href="/<?php echo $childMenu['slug'] ?>"><?php echo $childMenu['name'] ?></a>
                                            <?php endforeach; ?>
                                        </div>
                                    </li>
                                <?php else: ?>
                                    <li class="nav-item">
                                        <a class="nav-link"
                                           href="/<?php echo $result['slug'] ?>"><?php echo $result['name'] ?></a>
                                    </li>
                                <?php endif; ?>
                            <?php endforeach; ?>
                    </ul>
                </div>
        </nav>
    </div>
</div>
<?= $this->renderSection('content') ?>
<div class="footer"></div>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
<script>
    document.getElementById('getNextNew').addEventListener('click', getNextNew);

    function getNextNew() {
        fetch('/api/getNew/' + $("#new").last().data('new-id'))
            .then(response => response.json())
            .then(data => {
                if (data.status) {
                    const newNew = `
                    <div class="card-body p-0 mb-3 mt-3" id="new" data-new-id="${data.data.id}">
                        <div class="row no-gutters">
                            <div class="col-md-4">
                                <img src="${data.data.image}" width="100%">
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title">${data.data.title}</h5>
                                    <p class="card-text">${data.data.content}</p>
                                </div>
                            </div>
                        </div>
                    </div>`;
                    $('#news').prepend(newNew);
                } else {
                    $('#news').prepend(`<div class="alert alert-danger" role="alert">${data.message}</div>`);
                    TriggerAlertClose();
                }
            }).catch(err => {
            $('#news').prepend(`<div class="alert alert-danger" role="alert">Bir sorun oluştu lütfen daha sonra tekrar deneyiniz!</div>`);
            TriggerAlertClose();
        });
    }

    function TriggerAlertClose() {
        setTimeout(()=> {
            $('.alert').remove();
        }, 1500);
    }
</script>
</body>
</html>