@php
	$attrPrice = 0;
	$sessionCur = session()->get('currency');
	$sessionCurr = DB::table('currencies')->where('id',$sessionCur)->first();
	$databaseCurr = DB::table('currencies')->where('is_default',1)->first();
	$curr = $sessionCurr ? $sessionCurr: $databaseCurr;

	if($prod->user_id != 0){
        $attrPrice = $prod->price + $gs->fixed_commission + ($prod->price/100) * $gs->percentage_commission ;
        }

    if(!empty($prod->size) && !empty($prod->size_price)){
          $attrPrice += $prod->size_price[0];
      }

      if(!empty($prod->attributes)){
        $attrArr = json_decode($prod->attributes, true);
      }
@endphp

@if (!empty($prod->attributes))
	@php
	$attrArr = json_decode($prod->attributes, true);
	@endphp
	@endif

	@if (!empty($attrArr))
		@foreach ($attrArr as $attrKey => $attrVal)
			@if (array_key_exists("details_status",$attrVal) && $attrVal['details_status'] == 1)
				@foreach ($attrVal['values'] as $optionKey => $optionVal)
				@if ($loop->first)
					@if (!empty($attrVal['prices'][$optionKey]))
						@php
							$attrPrice = $attrPrice + $attrVal['prices'][$optionKey] * $curr->value;
						@endphp
					@endif
				@endif
			@endforeach
		@endif
	@endforeach
@endif

@php
  $withSelectedAtrributePrice = $attrPrice+$prod->price;
  $withSelectedAtrributePrice = round(($withSelectedAtrributePrice) * $curr->value,2);


@endphp
	

		<li>
			<div class="single-box">
				<div class="left-area">
					<img src="{{ $prod->thumbnail ? asset('assets/images/thumbnails/'.$prod->thumbnail):asset('assets/images/noimage.png') }}" alt="">
				</div>
				<div class="right-area">
						<div class="stars">
							<div class="ratings">
								<div class="empty-stars"></div>
								<div class="full-stars" style="width:{{App\Models\Rating::ratings($prod->id)}}%"></div>
							</div>
							</div>
							<h4 class="price">{{ $attrPrice != 0 ?  $gs->currency_format == 0 ? $curr->sign.$withSelectedAtrributePrice : $withSelectedAtrributePrice.$curr->sign :$prod->showPrice() }} <del>{{ $prod->showPreviousPrice() }}</del> </h4>
							<p class="text"><a href="{{ route('front.product',$prod->slug) }}">{{ mb_strlen($prod->name,'utf-8') > 35 ? mb_substr($prod->name,0,35,'utf-8').'...' : $prod->name }}</a></p>
				</div>
			</div>
		</li>




