<?= $this->extend('layout/master') ?>
<?= $this->section('content') ?>
<main role="main" class="container">
    <h1 class="mt-5 mb-5">
        <?= $page['title'] ?>
    </h1>
    <p class="lead">
        <?= $page['content'] ?>
    </p>
    <?php if (isset($page['static_page']) && is_file(APPPATH . '/views/static_pages/' . $page['static_page'])) : ?>
        <?php include APPPATH . '/views/static_pages/' . $page['static_page'] ?>
    <?php endif; ?>
</main>
<?= $this->endSection() ?>
