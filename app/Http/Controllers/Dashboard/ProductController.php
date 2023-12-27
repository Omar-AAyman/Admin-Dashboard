<?php

namespace App\Http\Controllers\Dashboard;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class ProductController extends Controller
{
    public const STATUSES = ['Not Active', 'Active'];
    public const MAX_UPLOAD_SIZE = 1024;  //1024kb
    public const AVAILABLE_EXTENSIONS = ['png', 'jpg', 'jpeg'];
    public function index()
    {

        $products = DB::table('products')->get();
        return view('products.index', compact('products'));
    }
    public function create()
    {
        $brands = DB::table('brands')->select('id', 'name_en', 'name_ar')->get();
        $sub_categories = DB::table('sub_categories')->select('id', 'name_en', 'name_ar')->get();

        return view('products.create', compact('brands', 'sub_categories'))->with('statuses', self::STATUSES);
    }
    public function store(Request $request)
    {

        //Validation
        $request->validate([
            'name_en' => ['required', 'string', 'max:32'],
            'name_ar' => ['required', 'string', 'max:32'],
            'price' => ['required', 'numeric', 'between:1,999999.99'],
            'quantity' => ['nullable', 'integer', 'between:1,99'],
            'code' => ['required', 'max:20', 'unique:products'],
            'status' => ['nullable', 'in: ' . implode(',', array_keys(self::STATUSES))],
            'brand_id' => ['nullable', 'integer', 'exists:brands,id'],
            'sub_category_id' => ['nullable', 'integer', 'exists:sub_categories,id'],
            'image' => ['required', 'max:' . self::MAX_UPLOAD_SIZE, 'mimes:' . implode(',', self::AVAILABLE_EXTENSIONS)],
        ]);
        $data = $request->except('_token', 'image');
        $photoName = $request->file('image')->hashName();
        $data['image'] = $photoName;
        $request->file('image')->move(public_path('assets/images/products'), $photoName);


        //Store
        DB::table('products')->insert($data);
    }
}
