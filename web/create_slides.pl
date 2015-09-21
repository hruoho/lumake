use strict;
use warnings;
use autodie;
use YAML qw(LoadFile);
use utf8;

my $data = '_data/data.yml';

my $context = 'osa2';

binmode STDIN, 'utf8';
binmode STDOUT, 'utf8';
####

my @data = @{LoadFile($data)};

foreach my $doc (@data){
	my %doc = %$doc;
	if($doc{'context'} eq $context){
		my $title = $doc{'title'};
		my $href = $doc{'href'};

		my $string = <<"END_SLIDE";
---
layout: slides
title: $title
---


<section>
	<h1>{{page.title}}</h1>
	<h3>{{site.data.$href.size}} tehtävää</h3>
</section>

{% for tehtava in site.data.$href %}

<section>

{% for piece in tehtava.tehtava %}

{% if forloop.first %}

	<section>

	<h1 class="teht"></h1>

	<p> {{ piece }} </p>

{% endif %}

{% if piece.first %}
	{% case piece.first[0] %}
		{% when 'img' %}
			<div style="text-align:center">
				<img style="width:80%; background:white" src="/imgs/{{piece.first[1] }}">
			</div>
		{% else %}
			<ol>
			{% for item in piece %}

				<li> {{ item }} </li>

			{% endfor %}
			</ol>
	{% endcase %}

{% elsif forloop.index > 1 %}

	</section>

	<section>
		{{ piece }}

{% endif %}

{% if forloop.last %}

	</section>

{% endif %}

{% endfor %}
</section>

{% endfor %}

END_SLIDE
		open my $fh, ">:utf8", "$href.html";
		print $fh $string;
		close $fh;
	}
}

