<?php

    namespace App\Controllers;

    use App\Models\News;

    class NewController extends BaseController
    {
        protected $new;

        public function __construct()
        {
            $this->new = new News();
        }

        public function show($slug)
        {
            $new = $this->new->where('slug', $slug)->find();
            if (!$new) {
                return view('errors/html/error_404');
            }

            return view('pages/new', ['new' => $new[0]]);
        }
    }
