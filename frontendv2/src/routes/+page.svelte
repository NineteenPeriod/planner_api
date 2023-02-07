<script>
	import { onMount } from 'svelte';
	import { list } from '../services/todo-service';

	let items = [];
	let selectedItem = 0;

	async function fetchList() {
		await list().then((response) => (items = response.data));
	}

	onMount(() => {
		fetchList();
	});
</script>

<div class=" bg-white rounded-lg shadow ">
	<div class="border-b border-gray-200 px-4 py-5 sm:px-6">
		<div class="-ml-4 -mt-2 flex flex-wrap items-center justify-between sm:flex-nowrap">
			<div class="ml-4 mt-2">
				<h3 class="text-lg font-medium leading-6 text-gray-900">To Dos</h3>
				{selectedItem}
			</div>
			<div class="ml-4 mt-2 flex-shrink-0">
				<button
					type="button"
					class="relative inline-flex items-center rounded-md border border-transparent bg-indigo-600 px-4 py-2 text-sm font-medium text-white shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2"
					>Create new to do</button
				>
			</div>
		</div>
	</div>
	<div class="">
		<ul role="list" class="divide-y divide-gray-200">
			{#each items as item, index}
				<li class="">
					<a
						href="#"
						class={selectedItem == item.id
							? 'block  border bg-indigo-50 border-indigo-200 z-10'
							: ''}
						class:rounded-b-lg={items.length == index + 1}
					>
						<div class="flex items-center px-4 py-4 sm:px-6">
							<div class="mr-6 flex items-center">
								<input
									type="radio"
									name="todo-items"
									class="h-4 w-4 text-indigo-600 border-gray-300 focus:ring-indigo-500"
									aria-labelledby="pricing-plans-0-label"
									aria-describedby="pricing-plans-0-description-0 pricing-plans-0-description-1"
									value={item.id}
									bind:group={selectedItem}
								/>
							</div>

							<div class="flex min-w-0 flex-1 items-center">
								<div class="min-w-0 flex-1 md:grid md:grid-cols-2 md:gap-4">
									<div>
										<p class="truncate text-sm font-medium text-indigo-600">{item.title}</p>
									</div>
									<div class="hidden md:block">
										<div>
											<p class=" flex items-center text-sm text-gray-500">
												<!-- Heroicon name: mini/check-circle -->
												{#if item.completed}
													<svg
														class="mr-1.5 h-5 w-5 flex-shrink-0 text-green-400"
														xmlns="http://www.w3.org/2000/svg"
														viewBox="0 0 20 20"
														fill="currentColor"
														aria-hidden="true"
													>
														<path
															fill-rule="evenodd"
															d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z"
															clip-rule="evenodd"
														/>
													</svg>
													Completado
												{:else}
													<svg
														xmlns="http://www.w3.org/2000/svg"
														fill="none"
														viewBox="0 0 24 24"
														stroke-width="1.5"
														stroke="currentColor"
														class="mr-1.5 h-5 w-5 flex-shrink-0 text-gray-400"
													>
														<path
															stroke-linecap="round"
															stroke-linejoin="round"
															d="M12 6v6h4.5m4.5 0a9 9 0 11-18 0 9 9 0 0118 0z"
														/>
													</svg>

													Pendiente
												{/if}
												<!-- {item.completed ? 'Completado' : 'Pendiente'} -->
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</a>
				</li>
			{/each}
		</ul>
	</div>
</div>
<!-- <style>
	.selectedRadio {
		bg-indigo-50 border-indigo-200 z-10
	}
</style> -->
