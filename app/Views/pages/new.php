<?= $this->extend('layout/master') ?>
<?= $this->section('content') ?>
    <main role="main" class="container">
        <div class="mt-5 mb-3">
            <img src="<?= $new['image'] ?>" width="100%">
        </div>
        <h1 class="mt-2 mb-3">
            <?= $new['title'] ?>
        </h1>
        <p class="lead">
            <?= $new['content'] ?>
        </p>
    </main>
<?= $this->endSection() ?>