<?php helper('string') ?>
<?= $this->extend('layout/master') ?>
<?= $this->section('content') ?>
<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">
        <?php foreach ($sliders as $slider) : ?>
            <div class="carousel-item <?= $slider['id'] == 1 ? 'active' : null ?>">
                <img class="d-block w-100"
                     src="<?= $slider['image'] ?>">
            </div>
        <?php endforeach; ?>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="card border-0">
                <div class="card-body p-0 pt-3">
                    <h4 class="card-title"><?= $page['title'] ?></h4>
                    <p class="card-text"><?php echo text_limit($page['content'], 550) ?></p>
                    <a href="/<?= $page['slug'] ?>" class="btn btn-primary">Devamı</a>
                </div>
            </div>
            <hr>
        </div>
        <div class="col-md-12">
            <div class="card border-0">
                <div class="card-body p-0">
                    <h4 class="card-title float-left">Haberler</h4>
                    <div class="card-text float-right h1"><span id="getNextNew" class="fa fa-plus cursor-pointer"></span> </div>
                </div>
            </div>
            <div class="card border-0" id="news">
                <div class="card-body p-0 mb-3 mt-3" id="new" data-new-id="<?=$new['id']?>">
                    <div class="row no-gutters">
                        <div class="col-md-4">
                            <img src="<?=$new['image']?>" width="100%">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h4 class="card-title"><a href="/haberler/<?=$new['slug']?>"> <?=$new['title']?></a></h4>
                                <p class="card-text"><?php echo text_limit($new['content'], 550) ?></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?= $this->endSection() ?>
