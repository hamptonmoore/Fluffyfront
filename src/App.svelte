<script>
  import router from "page";

  import Home from "./pages/Home.svelte";
  import ViewThread from "./pages/ViewThread.svelte";
  let page;
  let params;

  // Set up the pages to watch for
  router("/", () => (page = Home));
  router(
    "/viewThread/:id",
    (ctx, next) => {
      params = ctx.params;
      next();
    },
    () => (page = ViewThread)
  );
  router.start();
</script>

<svelte:component this={page} {params} />
