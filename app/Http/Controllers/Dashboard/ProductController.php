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
            'code' => ['required', 'integer', 'max:1000000', 'unique:products'],
            'status' => ['nullable', 'in: ' . implode(',', array_keys(self::STATUSES))],
            'brand_id' => ['nullable', 'integer', 'exists:brands,id'],
            'sub_category_id' => ['nullable', 'integer', 'exists:sub_categories,id'],
            'image' => ['required', 'max:' . self::MAX_UPLOAD_SIZE, 'mimes:' . implode(',', self::AVAILABLE_EXTENSIONS)],
        ]);
        $data = $request->only('name_en', 'name_ar', 'price', 'quantity', 'code', 'status', 'brand_id', 'sub_category_id', 'desc_ar', 'desc_en');
        $photoName = $request->file('image')->hashName();
        $data['image'] = $photoName; //Store hashed image's name into $data['image'] var

        $request->file('image')->move(public_path('assets/images/products'), $photoName);
        // dd($data);

        //Store
        DB::table('products')->insert($data);
        if ($request->has('redirect') && $request['redirect'] == 'index') {
            return redirect()->route('dashboard.products.index')->with('success', 'Product has been Created Successfully');
        } else {
            return redirect()->back()->with('success', 'Product has been Created Successfully');
        };
    }

    //Update
    public function edit($id)
    {
        $product = DB::table('products')->where('id', $id)->first();
        $brands = DB::table('brands')->select('id', 'name_en', 'name_ar')->get();
        $sub_categories = DB::table('sub_categories')->select('id', 'name_en', 'name_ar')->get();

        return view('products.edit', compact('product', 'brands', 'sub_categories'))->with('statuses', self::STATUSES);
    }
    public function update($id)
    {
        $product = DB::table('products')->where('id', $id)->first();
        $brands = DB::table('brands')->select('id', 'name_en', 'name_ar')->get();
        $sub_categories = DB::table('sub_categories')->select('id', 'name_en', 'name_ar')->get();

        return view('products.edit', compact('product', 'brands', 'sub_categories'))->with('statuses', self::STATUSES);
    }
}
